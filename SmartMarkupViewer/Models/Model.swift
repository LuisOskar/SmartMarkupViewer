//
//  Model.swift
//  
//
//  Created by 1024jp on 2017/03/04.
//
//

import Foundation

struct Document {
    
    let rawString: String
    let language: Language
    
    let sections: [Section]
    
}

struct Section {
    
    let title: StyledString?
    let level: Int
    let contents: [Block]
    let subsections: [Section]
}


enum Block {
    
    case paragraph(attributedString: NSAttributedString)
    case list(list: [StyledString])
    case code(language: String?, content: String)
}

struct Language {}

