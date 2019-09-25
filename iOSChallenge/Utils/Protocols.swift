//
//  Protocols.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

// MARK: - ReusableView
public protocol ReusableView: class { }

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

// MARK: - NibloadableView
public protocol NibloadableView: class { }

extension NibloadableView where Self: UIView {
  
  static var nibName: String {
    return String(describing: self)
  }
}

// MARK: - ConfigurableCell
protocol ConfigurableCell {
  
  associatedtype DataType
  func loadCellWithData(_ data: DataType)
}

// MARK: - CellConfigurator
protocol CellConfigurator {
  
  static var reuseId: String { get }
  func configure(cell: UIView)
}


