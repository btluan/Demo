//
//  LoadingIndicatorViewController.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

class LoadingIndicatorViewController: UIViewController {
  
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  init() {
    super.init(nibName: "LoadingIndicatorViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    indicator.startAnimating()
  }
}
