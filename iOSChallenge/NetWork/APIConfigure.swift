//
//  APIConfigure.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import Foundation
import Moya

enum APIEndpoints {
  case users
  case unknown(path: String)
}

fileprivate struct ComponentURL {
  static let baseURL: String = "https://api.github.com"
}

extension APIEndpoints: TargetType {
  var baseURL: URL {
    switch self {
    case .unknown(let path):
      return URL(string: path) ?? URL(string: ComponentURL.baseURL)!
    default:
      return URL(string: ComponentURL.baseURL)!
    }
  }
  
  var path: String {
    switch self {
    case .users:
      return "/users"
    default:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .users, .unknown:
      return .get
    }
  }
  
  public var parameterEncoding: ParameterEncoding {
    switch self {
    case .users, .unknown:
      return JSONEncoding.default
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .users, .unknown:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
}
