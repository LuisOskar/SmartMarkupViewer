//
//  ViewerViewController.swift
//  SmartMarkupViewer
//
//  Created by Luis Oscar Peredo on 3/4/17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import UIKit
import MarkupParser

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
}

extension ViewerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StyledStringTableViewCell", for: indexPath) as?  StyledStringTableViewCell,
            let section = self.documentToShow?.section
            else { return UITableViewCell() }
        cell.configure(section: section)
        return cell
    }
}
