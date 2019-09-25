//
//  Network.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import Moya
import Alamofire
import RxSwift
import RxCocoa

struct Network {
  static let provider = MoyaProvider<APIEndpoints>()
  
  let disposeBag = DisposeBag()
  
  static func request(target: APIEndpoints, success successCallback: @escaping (Any) -> Void,
                      error errorCallback: @escaping (Swift.Error) -> Void,
                      failure failureCallback: @escaping (MoyaError) -> Void) {
    _ = provider.rx.request(target).subscribe { event in
      switch event {
      case .success(let response):
        do {
          let data = try response.mapJSON()
          successCallback(data)
        } catch {
          let error = NSError(domain:"", code:-1, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
          errorCallback(error)
        }
      case .error(let error):
        failureCallback(error as! MoyaError)
      }
    }
  }
}
