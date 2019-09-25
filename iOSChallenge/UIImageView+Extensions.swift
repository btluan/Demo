//
//  UIImageView+Extensions.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
  func loadImage(fromUrl: URL?) {
    if let imageURL = fromUrl {
      self.kf.setImage(
        with: imageURL,
        placeholder: nil,
        options: [
          .scaleFactor(UIScreen.main.scale),
          .transition(.fade(1)),
          .cacheOriginalImage
        ])
      {
        result in
        switch result {
        case .success(let value):
          print("Task done for: \(value.source.url?.absoluteString ?? "")")
        case .failure(let error):
          print("Job failed: \(error.localizedDescription)")
        }
      }
    }
  }
}
