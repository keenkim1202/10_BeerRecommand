////
////  ViewController.swift
////  BeerRecommand
////
////  Created by KEEN on 2021/12/21.
////
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//  
//  // MARK: - IU
//  let tableView = UITableView()
//  let headerView = UIView()
//  let imageContainerView = UIView()
//  let imageView = UIImageView()
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    tableView.delegate = self
//    tableView.dataSource = self
//    tableView.register(StretchyTableViewCell.self, forCellReuseIdentifier: StretchyTableViewCell.identifier)
//    
//    setupUI()
//    setupConstraints()
//  }
//  
//  func setupUI() {
//    view.backgroundColor = .white
//    tableView.backgroundColor = .lightGray
//    imageContainerView.backgroundColor = .red
//    headerView.backgroundColor = .brown
//    imageView.backgroundColor = .orange
//    imageView.image = UIImage(systemName: "doc")
//    
//    
//    view.addSubview(tableView)
//    headerView.addSubview(imageContainerView)
//    tableView.tableHeaderView = headerView
//    imageContainerView.addSubview(imageView)
//    
//    tableView.setNeedsLayout()
//    tableView.layoutIfNeeded()
//  }
//  
//  func setupConstraints() {
//    headerView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//
//    tableView.snp.makeConstraints { make in
//      make.top.equalTo(headerView.snp.bottom)
//      make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
//    }
//    
//    imageContainerView.snp.makeConstraints { make in
//      make.leading.trailing.top.equalTo(view)
//      make.height.equalTo(200)
//      make.bottom.equalTo(tableView.snp.top)
//    }
//    
//    imageView.snp.makeConstraints { make in
//      make.leading.trailing.equalTo(view)
//      make.height.equalTo(headerView.snp.width).multipliedBy(0.7)
//    }
//  }
//  
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return 1
//  }
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 10
//  }
//  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: StretchyTableViewCell.identifier) as? StretchyTableViewCell else { return UITableViewCell() }
//    cell.textLabel?.text = "test"
//    cell.backgroundColor = .systemMint
//    return cell
//  }
//  
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 50
//  }
//  
//}
