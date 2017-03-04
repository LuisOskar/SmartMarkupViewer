//
//  Model+NSAttributedString.swift
//  SmartMarkupViewer
//
//  Created by Choi, Wanbok on 2017. 3. 4..
//  Copyright © 2017년 mrblanquito. All rights reserved.
//

import UIKit

typealias Attribute = (name: String, value: Any)
typealias RangedAttribute = (range: NSRange, name: String, value: Any)

extension StyledString {
  fileprivate var ranges: [NSRange] {
    return self.styles.map { $0.range }.map(self.string.nsRange)
  }
  
  fileprivate func attributes(level: Int) -> [Attribute] {
    return self.styles.flatMap { $0.attributed(level: level) }
  }
  
  func attributedString(level: Int) -> NSAttributedString {
    return NSMutableAttributedString(with: self, level: level)
  }
}

extension StyledString.Style {
  func attributed(level: Int) -> Attribute? {
    switch self.type {
    case .bold:
      return (name: NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: FontType.parse(with: level)))
    case .strike:
      return (name: NSStrikethroughStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue)
    default: return nil
    }
  }
}

fileprivate extension NSMutableAttributedString {
  convenience init(with styledString: StyledString, level: Int) {
    self.init(string: styledString.string)
    let ranges = styledString.ranges
    let attributes = styledString.attributes(level: level)
    ranges.enumerated()
      .map { (offset, range) -> RangedAttribute in
        return (range: range, name: attributes[offset].name, attributes[offset].value)
      }
      .forEach { self.addAttribute($0.name, value: $0.value, range: $0.range) }
  }
}

enum FontType: Int {
  case not, header1, header2, header3, content
  
  static func parse(with level: Int) -> CGFloat {
    let fontType = FontType.init(rawValue: level) ?? .not
    switch fontType {
    case .header1: return 16
    case .header2: return 14
    case .header3: return 12
    case .content: return 10
    default: return 5
    }
  }
}
