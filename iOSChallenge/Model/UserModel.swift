//
//  UserModel.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import ObjectMapper

class UserModel: Mappable {
  var id: String?
  var name: String?
  var avatar: URL?
  var inforUserURL: URL?
  init() {}
  required init?(map: Map) {}
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["login"]
    avatar <- (map["avatar_url"], URLTransform())
    inforUserURL <- (map["url"], URLTransform())
  }
}
