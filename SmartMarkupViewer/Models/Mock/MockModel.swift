//
//  MockModel.swift
//  SmartMarkupViewer
//
//  Created by Haik Ampardjian on 04.03.17.
//  Copyright © 2017 mrblanquito. All rights reserved.
//

import Foundation

struct MockModel {
    static let document = Document(rawString: "",
                            language: Language(),
                            sections: [
                                Section(title: StyledString(string: "Big Title",
                                                            styles: [
                                                                StyledString.Style(range: "Big Title".range(of: "Big")!,
                                                                                   type: .bold)
                                    ]),
                                        level: 1,
                                        contents: [
                                            .paragraph(attributedString: NSAttributedString(string: "Hello, \n this is a content for Big Title"))
                                    ],
                                        subsections: [
                                            Section(title: StyledString(string: "Second level Title",
                                                                        styles: [
                                                                            StyledString.Style(range: "Second level Title".range(of: "level")!,
                                                                                               type: .bold)
                                                ]),
                                                    level: 2,
                                                    contents: [
                                                        .paragraph(attributedString: NSAttributedString(string: "Hi There, this is a content for Second level Title"))
                                                ],
                                                    subsections: [])
                                    ])
        ])
}
