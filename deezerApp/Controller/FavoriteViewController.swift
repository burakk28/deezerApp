//
//  FavoriteViewController.swift
//  deezerApp
//
//  Created by Burak Kara on 8.05.2023.
//

import UIKit

private let reuseIdentifier = "FavoriteCell"

class FavoriteViewController:UITableViewController {
  
  
  // MARK: -Properties
  
  
  // MARK: -Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
    view.backgroundColor = .white
  }

}

// MARK: -Helpers

extension FavoriteViewController {
  
  private func style(){
    tableView.register(FavoriteCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.isUserInteractionEnabled = true
  }
  private func layout(){
    
  }
}
 // MARK: -UICollectionViewDataSource

extension FavoriteViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as! FavoriteCell
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 125
  }
  
}
