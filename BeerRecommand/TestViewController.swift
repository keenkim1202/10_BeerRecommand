//
//  TestViewController.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/21.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
  
  let dummyList: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(StretchyTableViewCell.self, forCellReuseIdentifier: StretchyTableViewCell.identifier)
    
    setupUI()
    setupConstraints()
    
    let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
    header.imageView.image = UIImage(named: "bluemoon")
    tableView.tableHeaderView = header
  }
  
  func setupUI() {
    view.addSubview(tableView)
    view.backgroundColor = .white
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: StretchyTableViewCell.identifier) as? StretchyTableViewCell else { return UITableViewCell() }
    cell.textLabel?.text = "\(dummyList[indexPath.row])"
    cell.backgroundColor = .systemMint
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
