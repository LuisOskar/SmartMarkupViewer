//
//  ViewerViewController.swift
//  SmartMarkupViewer
//
//  Created by Luis Oscar Peredo on 3/4/17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import UIKit

final class ViewerViewController: UIViewController {
    
    var documentToShow : Document? {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView?.register(StyledStringTableViewCell.self, forCellReuseIdentifier: "StyledStringTableViewCell")
            self.tableView?.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 0.01)) // It's a trick to remove seporator when data doesn't exist.
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // For Mocking
//        self.documentToShow = MockModel().document
    }
}

extension ViewerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.documentToShow?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StyledStringTableViewCell", for: indexPath) as?  StyledStringTableViewCell,
            let section = self.documentToShow?.sections[indexPath.row]
            else { return UITableViewCell() }
        cell.configure(section: section)
        return cell
    }
}
