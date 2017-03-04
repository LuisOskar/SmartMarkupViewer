//
//  StyledStringTableViewCell.swift
//  SmartMarkupViewer
//
//  Created by Choi, Wanbok on 2017. 3. 4..
//  Copyright © 2017년 mrblanquito. All rights reserved.
//

import UIKit
import MarkupParser

final class StyledStringTableViewCell: UITableViewCell {
    // MARK: Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    // MARK: Configures
    func configure(section: Section) {
        self.titleLabel.attributedText = section.attributedString
//        self.subTitleLabel.text = section.subsections.first?.title?.string
//        self.subTitleLabel.isHidden = self.subTitleLabel.text?.isEmpty != false
        if let text = section.subsections.first?.title?.string {
            self.subTitleLabel.text = text
            self.subTitleLabel.isHidden = false
        } else {
            self.subTitleLabel.text = nil
            self.subTitleLabel.isHidden = true
        }
    }
    
    private func configureLayout() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subTitleLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.greaterThanOrEqualToSuperview().inset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().inset(10)
        }
        
        self.subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().inset(10)
        }
    }
    
    // MARK: Initializer
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        self.contentView.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
        self.contentView.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        
        self.configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
