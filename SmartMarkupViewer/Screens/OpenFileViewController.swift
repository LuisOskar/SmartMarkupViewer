//
//  OpenFileViewController.swift
//  SmartMarkupViewer
//
//  Created by Luis Oscar Peredo on 3/4/17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import UIKit

class OpenFileViewController: UIViewController {
    
    private let viewModel = DownloadViewModel()
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var busyView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    @IBAction func download(_ _: UIButton!) {
        
        guard let addressString = addressTextField.text, !addressString.isEmpty else {
            
            let alert = UIAlertController(title: "Empty Address", message: "Please write a vaild URL", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }

        
        busyView.isHidden = false
        
        print("Downloading: \(addressTextField.text)")
        
        
        
        
        guard let parsedResult = FakeParser().parse(path: "") else {
            
            let alert = UIAlertController(title: "Sorry", message: "We couldn't parse this file.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        
        // Show the Viewer here with the text
        
        let storyboard = UIStoryboard(name: "ViewerViewController", bundle: nil)
        
        guard let viewerVC = storyboard.instantiateInitialViewController() as? ViewerViewController else {
            return
        }
        
        print("\(parsedResult)")
        
        viewerVC.documentToShow = parsedResult
        
        
        self.show(viewerVC, sender: self)
    }

    
    @IBAction func loadURLButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            //
            addressTextField.text = "Wrong Address"
            break
        case 2:
            //
            addressTextField.text = "https://github.com/ReactiveX/RxSwift/blob/master/README.md"
            break
        default:
            // default swift address
            addressTextField.text = "https://github.com/apple/swift/blob/master/README.md"
            
        }
        
        
    }
}
