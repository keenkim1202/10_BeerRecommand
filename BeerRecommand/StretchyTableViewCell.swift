//
//  StretchyTableViewCell.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/21.
//

import UIKit
import SnapKit

class StretchyTableViewCell: UITableViewCell {
  
  static let identifier = "stretchCell"
  
  let label = UILabel()
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    setupUI()
//    setupConstraints()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setupUI() {
    self.addSubview(label)
    label.textColor = .blue
  }
  
  func setupConstraints() {
    label.snp.makeConstraints { make in
//      make.leading.equalToSuperview().inset(10)
      make.centerX.centerY.equalTo(self.contentView)
//      make.trailing.equalToSuperview().inset(10)
    }
  }
  
}
