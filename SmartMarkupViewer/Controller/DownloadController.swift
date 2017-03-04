//
//  DownloadController.swift
//  SmartMarkupViewer
//
//  Created by Haik Ampardjian on 04.03.17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import UIKit

final class DownloadController: UIViewController {
    private let viewModel = DownloadViewModel()
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func download(_ _: UIButton!) {
        viewModel.download(link: textfield.text ?? "", callback: { error in
            guard error == nil else { return }
            
        })
    }
}
