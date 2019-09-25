//
//  User+Network.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import Alamofire
import RxSwift
import Moya

extension Network {
  static func getUsers() -> Observable<[UserModel]> {
    return Observable<[UserModel]>.create({ sender in
      Network.request(target: .users, success: { (jsonData) in
        guard let data = jsonData as? [[String: Any]] else {
          sender.onError(NetworkError.nodata)
          return
        }
        let users = data.compactMap({ UserModel(JSON: $0) })
        sender.onNext(users)
      }, error: { (error) in
        sender.onError(NetworkError.user)
      }, failure: { (moyaError) in
        sender.onError(NetworkError.moyaError)
      })
      return Disposables.create()
    })
  }
  
  static func getUserDetail(path: String) -> Observable<UserInforModel> {
    return Observable<UserInforModel>.create({ sender in
      Network.request(target: .unknown(path: path), success: { (jsonData) in
        guard let data = jsonData as? [String: Any], let userDetail = UserInforModel(JSON: data) else {
          sender.onError(NetworkError.nodata)
          return
        }
        sender.onNext(userDetail)
      }, error: { (error) in
        sender.onError(NetworkError.unknown)
      }, failure: { (moyaError) in
        sender.onError(NetworkError.moyaError)
      })
      return Disposables.create()
    })
  }
}
