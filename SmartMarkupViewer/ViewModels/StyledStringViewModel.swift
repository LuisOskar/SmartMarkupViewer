//
//  StyledStringViewModel.swift
//  SmartMarkupViewer
//
//  Created by Choi, Wanbok on 2017. 3. 4..
//  Copyright © 2017년 mrblanquito. All rights reserved.
//

import Foundation
import MarkupParser

struct StyledStringViewModel {
    let attributedString: NSAttributedString?
    
    init(section: Section) {
        self.attributedString = section.attributedString
    }
}
