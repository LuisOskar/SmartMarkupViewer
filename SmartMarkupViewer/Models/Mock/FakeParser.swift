//
//  FakeParser.swift
//  SmartMarkupViewer
//
//  Created by Haik Ampardjian on 04.03.17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import Foundation
import MarkupParser

struct FakeParser {
    
    // Parsing might fail, so the response is an optional
    func parse(path: String = "") -> Document? {
//        var text: String = ""
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            
//            //reading
//            do {
//                text = try String(contentsOf: URL(string: path)!, encoding: String.Encoding.utf8)
//            }
//            catch {/* error handling here */}
//        }
//        
//        print("input text: \(text)")
        
        
        print("A")
        
        guard let path = Bundle.main.path(forResource: "Test", ofType: "md") else {
            return nil
        }
        
        let content = try? String(contentsOfFile:path, encoding: String.Encoding.utf8)
        
        print("\(content)")
        
        let parser = MarkupParser()
        
        return parser.parse(string: content!)
    }
}


