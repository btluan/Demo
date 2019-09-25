//
//  ListUserViewController.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

class ListUserViewController: BaseViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  private var viewModel: ListUserViewModelType!
  
  internal static func instantiate(viewModel: ListUserViewModel) -> ListUserViewController {
    let vc = R.storyboard.main.listUserViewController()
    vc!.viewModel = viewModel
    return vc!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initView()
    loadUsers()
    getUsers()
    
  }
}

extension ListUserViewController {
  private func initView() {
    tableView.register(ImageLabelTableViewCell.self)
    tableView.register(LabelTableViewCell.self)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 10
  }
  
  private func getUsers() {
    showLoadingIndicator { [weak self] in
      guard let self = self else { return }
      self.viewModel.getUsers()
    }
  }
  
  private func loadUsers() {
    viewModel.getUsersPublishSubjectSignal
      .subscribe(onNext: { [weak self] in
        guard let self = self else { return }
        self.hideLoadingIndicator()
        self.tableView.reloadData()
        }, onError: { [weak self] error in
          guard let self = self else { return }
          self.hideLoadingIndicator()
        }, onCompleted: nil, onDisposed: nil)
      .disposed(by: self.disposeBag)
  }
}

// MARK: UITableViewDelegate
extension ListUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let url = viewModel.users[indexPath.row].inforUserURL
    let userDetailVM = UserDetailViewModel(path: url?.absoluteString ?? "")
    let vc = UserDetailViewController.instantiate(viewModel: userDetailVM)
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: UITableViewDataSource
extension ListUserViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let avatarURL = viewModel.users[indexPath.row].avatar {
      let name = viewModel.users[indexPath.row].name
      let imageLabelCell = tableView.dequeuReusableCell(for: indexPath) as ImageLabelTableViewCell
      imageLabelCell.loadData(imageUrl: avatarURL, name: name)
      return imageLabelCell
    } else {
      let name = viewModel.users[indexPath.row].name
      let lableCell = tableView.dequeuReusableCell(for: indexPath) as LabelTableViewCell
      lableCell.loadData(name: name)
      return lableCell
    }
    
  }
  
  
}
