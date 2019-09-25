//
//  LabelTableViewCell.swift
//  iOSChallenge
//
//  Created by Bui To  Luan on 9/25/19.
//  Copyright © 2019 Bui To  Luan. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell, NibloadableView, ReusableView {
  
  @IBOutlet private weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  func loadData(name: String?) {
    nameLabel.text = name
  }
}
