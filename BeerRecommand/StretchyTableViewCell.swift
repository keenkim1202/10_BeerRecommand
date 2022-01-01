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
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    self.addSubview(label)
    label.textColor = .blue
    label.backgroundColor = .red
    label.text = "test text"
    label.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(label)
  }
  
  func setupConstraints() {
    label.snp.makeConstraints { make in
     make.leading.equalToSuperview().inset(10)
      make.centerX.centerY.equalTo(self.contentView)
     make.trailing.equalToSuperview().inset(10)
    }
  }
  
}
