//
//  UITableView+Extentions.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

extension UITableView {
  func register<T: UITableViewCell> (_: T.Type) where T: ReusableView, T: NibloadableView  {
    let nib = UINib(nibName: T.nibName, bundle: nil)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeuReusableCell<T: UITableViewCell>(for indexPath: IndexPath)  -> T where T: ReusableView {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    
    return cell
  }
  
  func dequeuReusableCell(withCellType item: CellConfigurator)  -> UITableViewCell {
    guard let cell = dequeueReusableCell(withIdentifier: type(of: item).reuseId) else {
      fatalError("could not dequeue cell with identifier: \(type(of: item).reuseId)")
    }
    
    return cell
  }
  
  func reloadData(completion: @escaping ()->()) {
    UIView.animate(withDuration: 0, animations: {
      self.reloadData()
    })
    { _ in completion() }
  }
}
