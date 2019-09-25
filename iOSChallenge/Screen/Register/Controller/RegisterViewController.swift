//
//  RegisterViewController.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import RxSwift
import RxCocoa

final class RegisterViewController: BaseViewController {
  
  @IBOutlet private weak var nameTextField: UITextField!
  @IBOutlet private weak var emailTextField: UITextField!
  @IBOutlet private weak var confirmEmailTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  @IBOutlet private weak var confirmPasswordTextField: UITextField!
  @IBOutlet private weak var registerButton: UIButton!
  
  private var viewModel: RegisterViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initView()
    initObservable()
    logicRegisterButton()
  }
  
  @IBAction func handleRegister(_ sender: Any) {
    let vc = ListUserViewController.instantiate(viewModel: ListUserViewModel())
    let nav = UINavigationController(rootViewController: vc)
    present(nav, animated: true, completion: nil)
  }
}

extension RegisterViewController {
  private func initView() {
    viewModel = RegisterViewModel()
    validateRegisterButton(false)
  }
  
  private func validateRegisterButton(_ isActive: Bool) {
    registerButton.backgroundColor = isActive ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    registerButton.isEnabled = isActive
  }
  
  private func initObservable() {
    nameTextField.rx.text
      .map { $0 ?? "" }
      .bind(to: viewModel.name)
      .disposed(by: disposeBag)
    
    emailTextField.rx.text
      .map { $0 ?? "" }
      .bind(to: viewModel.email)
      .disposed(by: disposeBag)
    
    confirmEmailTextField.rx.text
      .map { $0 ?? "" }
      .bind(to: viewModel.confirmEmail)
      .disposed(by: disposeBag)
    
    passwordTextField.rx.text
      .map { $0 ?? "" }
      .bind(to: viewModel.password)
      .disposed(by: disposeBag)
    
    confirmPasswordTextField.rx.text
      .map { $0 ?? "" }
      .bind(to: viewModel.confirmPassword)
      .disposed(by: disposeBag)
  }
  
  private func logicRegisterButton() {
    let combineLatest = Observable.combineLatest(viewModel.name.asObservable(),
                                                 viewModel.email.asObservable(),
                                                 viewModel.confirmEmail.asObservable(),
                                                 viewModel.password.asObservable(),
                                                 viewModel.confirmPassword.asObservable())
    combineLatest
      .subscribe(onNext: { [weak self] (name, email, confirmEmail, password, confirmPassword) in
        guard let self = self else { return }
        let isActive = self.viewModel.validate(name, email, confirmEmail, password, confirmPassword)
        self.validateRegisterButton(isActive)
        
    }, onError: nil, onCompleted: nil, onDisposed: nil)
      .disposed(by: disposeBag)
  }
}
