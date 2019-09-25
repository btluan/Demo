//
//  String+Extensions.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

fileprivate enum RegularExpressions: String {
  case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
  case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

extension String {
  
  var isBlank: Bool {
    get {
      let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
      return trimmed.isEmpty
    }
  }
  
  var isEmailValid: Bool {
    get {
      return isValid(regex: RegularExpressions.email.rawValue)
    }
  }
  
  private func isValid(regex: String) -> Bool {
    let matches = range(of: regex, options: .regularExpression)
    return matches != nil
  }
  
  func formatTwoString(_ two: String,
                       _ firstFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
                       _ twoFont: UIFont = UIFont.systemFont(ofSize: 14),
                       _ firstColor: UIColor = .black,
                       _ twoColor: UIColor = .black) -> NSMutableAttributedString {
    let firstAttStringKey = [NSAttributedString.Key.font: firstFont,
                             NSAttributedString.Key.foregroundColor: firstColor]
    let twoAttStringKey = [NSAttributedString.Key.font: twoFont,
                           NSAttributedString.Key.foregroundColor: twoColor]
    let titleAttributeString = NSMutableAttributedString(string: self,
                                                         attributes: firstAttStringKey)
    let contentAttributedString = NSAttributedString(string: two,
                                                     attributes: twoAttStringKey)
    titleAttributeString.append(contentAttributedString)
    
    return titleAttributeString
  }
}
