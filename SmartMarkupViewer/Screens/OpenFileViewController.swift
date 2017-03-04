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
        
        busyView.isHidden = false
        
        viewModel.download(link: addressTextField.text ?? "", callback: { error in
            self.busyView.isHidden = true
            
            guard error == nil else { return }
            
            
            // Show the Viewer here with the text
            
            let storyboard = UIStoryboard(name: "ViewerViewController", bundle: nil)
            
            guard let viewerVC = storyboard.instantiateInitialViewController() as? ViewerViewController else {
                return
            }
            
//            viewerVC.documentToShow = viewModel.
            
            
            self.present(viewerVC, animated: true, completion: nil)
            
        })
    }

    
    // MARK: - Navigation
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        
//        
//        if identifier == "ViewrViewControllerSegue"
//        {
//            viewModel.download(link: addressTextField.text ?? "", callback: { error in
//                guard error == nil else { return }
//                
//            })
//        }
//        
//        return true
//    }
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        guard let addressString = addressTextField.text, !addressString.isEmpty else {
//            
//            let alert = UIAlertController(title: "Empty Address", message: "Please write a vaild URL", preferredStyle: .alert)
//            
//            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            
//            self.show(alert, sender: self)
//            
//            return
//        }
//        
//
//        
//        
//        if let viewerVC = segue.destination as? ViewerViewController {
//            
//            
//            
//        }
//    }
}
