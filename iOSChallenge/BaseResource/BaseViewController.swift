//
//  BaseViewController.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import RxSwift
import RxCocoa
import MaterialComponents.MaterialSnackbar

class BaseViewController: UIViewController {
  var disposeBag = DisposeBag()
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  private let loadingVC = LoadingIndicatorViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func showLoadingIndicator(completion: @escaping (() -> Void)) {
    if UserDefault.shared.getDidShowLoading() {
      return
    } else {
      UserDefault.shared.setDidShowLoading()
      loadingVC.modalTransitionStyle = .crossDissolve
      loadingVC.modalPresentationStyle = .overFullScreen
      present(loadingVC, animated: false, completion: {
        completion()
      })
    }
  }

  func showSnackBarMessage(_ message: String, duration: TimeInterval = Constants.SnackBar.duration) {
    let snackbarMessage = MDCSnackbarMessage()
    snackbarMessage.text = message
    snackbarMessage.duration = duration
    MDCSnackbarManager.alignment = .center
    MDCSnackbarManager.show(snackbarMessage)
  }
  
  func hideLoadingIndicator(completion: (()->())? = nil) {
    UserDefault.shared.setDidShowLoading(value: false)
    loadingVC.dismiss(animated: true, completion: {
      completion?()
    })
  }
}
