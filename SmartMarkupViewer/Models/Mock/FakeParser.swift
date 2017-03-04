//
//  FakeParser.swift
//  SmartMarkupViewer
//
//  Created by Haik Ampardjian on 04.03.17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import Foundation

struct FakeParser {
    
    // Parsing might fail, so the response is an optional
    func parse(path: String = "") -> Document? {
        
        return MockModel.document
    }
}
