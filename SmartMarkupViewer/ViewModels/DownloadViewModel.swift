//
//  DownloadViewModel.swift
//  SmartMarkupViewer
//
//  Created by Haik Ampardjian on 04.03.17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import Foundation

final class DownloadViewModel {
    var tempLocalUrl: URL?
    
    func download(link string: String, callback: @escaping (_ error: String?, _ path: URL?) -> ()) {
        guard let url = URL(string: string) else { return }
        let filename = string.components(separatedBy: "/").last ?? "test.md"
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = try! URLRequest(url: url)
        
        var filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        filePath = (filePath as NSString).strings(byAppendingPaths: [filename]).first!
        tempLocalUrl = NSURL.fileURL(withPath: filePath)
        
        if FileManager.default.fileExists(atPath: filePath) {
            try? FileManager.default.removeItem(atPath: filePath)
        }
        
        let task = session.downloadTask(with: request) { [weak self] (tLocalUrl, response, error) in
            
            if error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tLocalUrl!, to: self?.tempLocalUrl ?? URL(string: "http://google.com")!)
                    callback(nil, self!.tempLocalUrl!)
                } catch (let writeError) {
                    callback(writeError.localizedDescription, nil)
                }
                
            } else {
                print("Failure: %@", error?.localizedDescription ?? "")
            }
        }
        task.resume()
    }
}
