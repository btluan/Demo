//
//  RegisterViewModel.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import RxSwift
import RxCocoa

protocol RegisterViewModelType {
  var name: Variable<String> { get }
  var email: Variable<String> { get }
  var confirmEmail: Variable<String> { get }
  var password: Variable<String> { get }
  var confirmPassword: Variable<String> { get }
  
  func validate(_ name: String, _ email: String, _ confirmEmail: String, _ pass: String, _ confirmPass: String) -> Bool
}

class RegisterViewModel: BaseViewModel, RegisterViewModelType {
  var name: Variable<String> = Variable<String>("")
  var email: Variable<String> = Variable<String>("")
  var confirmEmail: Variable<String> = Variable<String>("")
  var password: Variable<String> = Variable<String>("")
  var confirmPassword: Variable<String> = Variable<String>("")
  
  func validate(_ name: String, _ email: String, _ confirmEmail: String, _ pass: String, _ confirmPass: String) -> Bool {
    return (!name.isEmpty && email.isEmailValid && (confirmEmail == email) && !pass.isEmpty && (confirmPass == pass))
  }
}
