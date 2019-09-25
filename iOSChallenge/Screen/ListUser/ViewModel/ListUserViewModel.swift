//
//  ListUserViewModel.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import RxSwift

protocol ListUserViewModelType {
  var users: [UserModel] { get set }
  var getUsersPublishSubjectSignal: PublishSubject<Void> { get }
  func getUsers()
}

class ListUserViewModel: BaseViewModel, ListUserViewModelType {
  var getUsersPublishSubjectSignal: PublishSubject<Void> = PublishSubject<Void>()
  
  var users: [UserModel] = []
  func getUsers() {
    Network.getUsers()
      .subscribe(onNext: { (users) in
      self.users = users
      self.getUsersPublishSubjectSignal.onNext(())
    }, onError: { error in
      self.getUsersPublishSubjectSignal.onError(error)
      }, onCompleted: nil, onDisposed: nil)
      .disposed(by: disposeBag)
  }
}
