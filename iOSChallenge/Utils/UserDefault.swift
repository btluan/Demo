//
//  UserDefault.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

final class UserDefault {
  static let shared = UserDefault()
  private var defaults: UserDefaults
  private let kDidShowLoading = "kDidShowLoading"
  
  init() {
    defaults = UserDefaults.standard
  }
  
  func setDidShowLoading(value: Bool = true) {
    defaults.set(value, forKey: kDidShowLoading)
  }
  
  func getDidShowLoading() -> Bool {
    return defaults.object(forKey: kDidShowLoading) as? Bool ?? false
  }
}
