//
//  ViewController.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  private var viewModel = BeerViewModel()
  let dummyList: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  
  // MARK: - UI
  let tableView = UITableView()
  
  // MARK: - View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.viewModel.fetchBeer()
    
    viewModel.beer.bind { beer in
      self.tableView.reloadData()
    }
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(StretchyTableViewCell.self, forCellReuseIdentifier: StretchyTableViewCell.identifier)
    
    setupUI()
    setupConstraints()
    
    let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
    header.imageView.image = UIImage(named: "cheers")
    tableView.tableHeaderView = header
  }
  
  // MARK: - Configure
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

// MARK: - TableView Delegate & DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: StretchyTableViewCell.identifier, for: indexPath) as? StretchyTableViewCell else { return UITableViewCell() }
    let data = viewModel.beer.value
    print("data - ", data)
    cell.label.text = "\(data.name), \(data.tagline)"
    cell.label.backgroundColor = .orange
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}

// MARK: - ScrollViewDidScroll
extension ViewController {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let header = tableView.tableHeaderView as? HeaderView else { return }
    header.scrollViewDidScroll(scrollView: tableView)
  }
}
