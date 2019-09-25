//
//  UserDetailViewController.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

final class UserDetailViewController: BaseViewController {
  
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var companyLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var blogLabel: UILabel!
  @IBOutlet weak var inforUserView: UIView!
  
  private var viewModel: UserDetailViewModelType!
  internal static func instantiate(viewModel: UserDetailViewModel) -> UserDetailViewController {
    let vc = R.storyboard.main.userDetailViewController()
    vc!.viewModel = viewModel
    return vc!
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    loadInforUser()
    getUserInfor()
  }
}

extension UserDetailViewController {
  
  private func getUserInfor() {
    showLoadingIndicator { [weak self] in
      guard let self = self else { return }
      self.viewModel.getUserDetail()
    }
    
  }
  
  private func loadInforUser() {
    viewModel.getUserDetailPublishSubjectSignal
      .subscribe(onNext: { [weak self] in
      guard let self = self else { return }
        self.hideLoadingIndicator()
        self.layoutView()
      }, onError: { [weak self] (error) in
        guard let self = self else { return }
        self.hideLoadingIndicator()
    }, onCompleted: nil, onDisposed: nil)
      .disposed(by: self.disposeBag)
  }
  
  private func layoutView() {
    if let user = viewModel.users {
      inforUserView.isHidden = false
      layoutUIInforUser(user: user)
    } else {
      inforUserView.isHidden = true
    }
  }
  
  private func layoutUIInforUser(user: UserInforModel) {
    if let name = viewModel.users?.name {
      nameLabel.attributedText = "Name: ".formatTwoString(name)
    } else {
      nameLabel.attributedText = nil
    }
    
    if let companyName = viewModel.users?.companyName {
      companyLabel.attributedText = "Company: ".formatTwoString(companyName)
    } else {
      companyLabel.attributedText = nil
    }
    
    if let location = viewModel.users?.location {
      locationLabel.attributedText = "Location: ".formatTwoString(location)
    } else {
      locationLabel.attributedText = nil
    }
    
    if let blog = viewModel.users?.blog, !blog.isBlank {
      blogLabel.attributedText = "Blog: ".formatTwoString(blog)
    } else {
      blogLabel.attributedText = nil
    }
  }
}
