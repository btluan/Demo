//
//  NetworkError.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

enum NetworkError: Error {
  case user
  case unknown
  case moyaError
  case nodata
}

class MessageError: Error {
  var message: String?
  
  private init() {}
  init (message: String?) {
    self.message = message
  }
  
  static func value(error: NetworkError) -> MessageError {
    switch error {
    default:
      return MessageError(message: "system error")
    }
  }
}

