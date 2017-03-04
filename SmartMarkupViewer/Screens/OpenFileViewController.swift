//
//  OpenFileViewController.swift
//  SmartMarkupViewer
//
//  Created by Luis Oscar Peredo on 3/4/17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import UIKit

class OpenFileViewController: UIViewController {

    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let addressString = addressTextField.text, !addressString.isEmpty else {
            
            let alert = UIAlertController(title: "Empty Address", message: "Please write a vaild URL", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.show(alert, sender: self)
            
            return
        }
        
        
        if let viewerVC = segue.destination as? ViewerViewController {
            
            
            
        }
    }
}
