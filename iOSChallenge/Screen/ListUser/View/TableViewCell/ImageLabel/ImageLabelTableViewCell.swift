//
//  ImageLabelTableViewCell.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

class ImageLabelTableViewCell: UITableViewCell, NibloadableView, ReusableView {
  @IBOutlet private weak var avatarImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  func loadData(imageUrl: URL, name: String?) {
    avatarImageView.loadImage(fromUrl: imageUrl)
    nameLabel.text = name
  }
}
