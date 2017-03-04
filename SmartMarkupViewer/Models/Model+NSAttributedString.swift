//
//  Model+NSAttributedString.swift
//  SmartMarkupViewer
//
//  Created by Choi, Wanbok on 2017. 3. 4..
//  Copyright © 2017년 mrblanquito. All rights reserved.
//

import UIKit

typealias RangedAttribute = (NSRange, [String: Any])

extension NSAttributedString {
  convenience init(with styledString: StyledString, level: Int) {
    let mutableAttributedString = NSMutableAttributedString(string: styledString.string)
    let rangedAttributes = styledString.styles
      .map { $0.rangedAttributed(level: level) }
      .forEach {
        mutableAttributedString.addAttribute($0.1, range: $0.0)
    }
    return mutableAttributedString
  }
}

extension Style {
  func rangedAttributed(level: Int) -> RangedAttribute {
    let dictionaries: [String: Any]? = {
      switch self.type {
      case .bold:
        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: FontType.fontSize(with: level))]
      case .strike:
        return [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
      default: return nil
      }
    }()
    let range = NSRange(self.range)
    return (range, dictionaries ?? [])
  }
}

enum FontType: Int {
  case not, header1, header2, header3, content
  func fontSize(with level: Int) -> CGFloat {
    let fontType = FontType.init(rawValue: level) ?? .not
    switch fontType {
    case .header1: return 16
    case .header2: return 14
    case .header3: return 12
    case .content: return 10
    default: 5
    }
  }
}
