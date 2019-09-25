//
//  UserDetailViewModel.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import RxSwift

protocol UserDetailViewModelType {
  var path: String { get }
  var users: UserInforModel? { get set }
  var getUserDetailPublishSubjectSignal: PublishSubject<Void> { get }
  func getUserDetail()
}

class UserDetailViewModel: BaseViewModel, UserDetailViewModelType {
  var path: String = ""
  var users: UserInforModel? = nil
  var getUserDetailPublishSubjectSignal: PublishSubject<Void> = PublishSubject<Void>()
  
  init(path: String) {
    self.path = path
  }
  
  func getUserDetail() {
    Network.getUserDetail(path: path)
      .subscribe(onNext: { (userInfor) in
        self.users = userInfor
        self.getUserDetailPublishSubjectSignal.onNext(())
      }, onError: { (error) in
        self.getUserDetailPublishSubjectSignal.onError(error)
      }, onCompleted: nil, onDisposed: nil)
      .disposed(by: disposeBag)
  }
}
