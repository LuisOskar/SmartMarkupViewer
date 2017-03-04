//
//  StyledStringView.swift
//  SmartMarkupViewer
//
//  Created by Choi, Wanbok on 2017. 3. 4..
//  Copyright © 2017년 mrblanquito. All rights reserved.
//

import UIKit
import SnapKit

class StyledStringView: UIView {
  // MARK: Configures
  private func configure(viewModel: StyledStringViewModel) {
    let label = UILabel()
    label.numberOfLines = 0
    label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
    label.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
    label.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
    label.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)
    label.attributedText = viewModel.attributedString
    
    self.addSubview(label)
    label.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
  
  // MARK: Initializer
  required init(viewModel: StyledStringViewModel) {
    super.init(frame: .zero)
    self.configure(viewModel: viewModel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
