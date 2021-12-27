//
//  HeaderView.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/21.
//

import UIKit
import Foundation

class HeaderView: UIView {
  
  // MARK: - UI
  let containerView = UIView()
  let imageView: UIImageView = {
    let v = UIImageView()
    v.clipsToBounds = true
    v.contentMode = .scaleAspectFill
    return v
  }()
  
  private var imageViewHeight = NSLayoutConstraint()
  private var imageViewBottom = NSLayoutConstraint()
  private var containerViewHeight = NSLayoutConstraint()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setViewConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  private func createViews() {
    addSubview(containerView)
    containerView.addSubview(imageView)
  }
  
  private func setViewConstraints() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalTo: containerView.widthAnchor),
      centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      heightAnchor.constraint(equalTo: containerView.heightAnchor)
    ])
    
    containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
    containerViewHeight.isActive = true
    
    imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    imageViewBottom.isActive = true
    
    imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
    imageViewHeight.isActive = true
  }
  
  // MARK: - ScrollViewDidScroll
   public func scrollViewDidScroll(scrollView: UIScrollView) {
     containerViewHeight.constant = scrollView.contentInset.top
     
     let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
     containerView.clipsToBounds = offsetY <= 0
     imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
     imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
   }
  
}
