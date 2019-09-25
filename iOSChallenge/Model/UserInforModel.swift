//
//  UserInforModel.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import ObjectMapper

class UserInforModel: Mappable {
  
  var name: String?
  var companyName: String?
  var location: String?
  var blog: String?
  
  init() {}
  required init?(map: Map) {}
  func mapping(map: Map) {
    name <- map["name"]
    companyName <- map["company"]
    location <- map["location"]
    blog <- map["blog"]
  }
}
