//
//  DataMockup.swift
//  SmartMarkupViewer
//
//  Created by Luis Oscar Peredo on 3/4/17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import Foundation


//struct Document {
//    
//    let rawString: String
//    let language: Language
//    
//    let sections: [Section]
//    
//}
//
//struct Section {
//    
//    let title: StyledString?
//    let level: Int
//    let contents: [Block]
//    let subsections: [Section]
//}
//
//
//enum Block {
//    
//    case paragraph(attributedString: StyledString)
//    case list(list: [StyledString])
//    case code(language: String?, content: String)
//    case table(string: String)
//}

//struct StyledString {
//    
//    let string: String
//    let styles: [Style]
//    
//    struct Style {
//        
//        let range: Range<String.Index>
//        let type: Type
//        
//        
//        enum `Type` {
//            
//            case bold
//            case strike
//            case link(url: String)
//            case image(url: String)
//        }
//    }
//}




class MockupData  {
    
    
    let document : Document
    
    
    init() {
        
        var sectionsContainer : [Section] = [Section]()
        
        
        var sectionOneBlocks : [Block] = [Block]()
    
        /*
        
        StyledString(string: "Some String", styles: <#T##[StyledString.Style]#>)
        
        
        sectionOneBlocks.append(Block.paragraph(attributedString: StyledString(string: "Block 1 styled string", styles: [Style.Type]))
        
        sectionsContainer.append(Section(title: "Section of level 1", level: 1, contents: <#T##[Block]#>, subsections: <#T##[Section]#>)
        
         */

        
        self.document = Document(rawString: "Example MetaData?", language: Language(), sections: [])
        
        

        
    }
    
}
