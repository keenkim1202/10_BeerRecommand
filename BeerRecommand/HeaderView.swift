//
//  HeaderView.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/21.
//

import UIKit
import Foundation
import SnapKit

class HeaderView: UIView {
  let containerView = UIView()
  let imageView: UIImageView = {
    let v = UIImageView()
    v.clipsToBounds = true
    v.contentMode = .scaleAspectFit
    return v
  }()
  
  var imageViewHeight = NSLayoutConstraint()
  var imageViewBottom = NSLayoutConstraint()
  var contentViewHeight = NSLayoutConstraint()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setViewConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createViews() {
    addSubview(containerView)
    containerView.addSubview(imageView)
  }
  
  private func setViewConstraints() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    
    containerView.snp.makeConstraints {
      $0.width.equalTo(self.snp.width)
      $0.height.equalTo(self.snp.height)
    }
    
    imageView.snp.makeConstraints {
      $0.centerX.equalTo(self.snp.centerX)
      $0.bottom.equalTo(containerView.snp.bottom)
      $0.height.equalTo(containerView.snp.height)
    }
    
    imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
  }
  
   public func scrollViewDidScroll(scrollView: UIScrollView) {
     contentViewHeight.constant = scrollView.contentInset.top
     let offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top)
     containerView.clipsToBounds = offsetY <= 0
     imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
     imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
   }
  
}
