//
//  CategoryDetailViewController.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import UIKit
import Alamofire

private let reuseIdentifier = "MusicCell"

class MusicViewController : UICollectionViewController {
 
// MARK: -Properties
  var musicResult:[MusicMain] = [] {
    didSet{collectionView.reloadData()}
  }
// MARK: -Lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()
      style()
      layout()
      Service.fetchData(){result in
        self.musicResult = result
      }
    }
  init() {
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
         layout()
     }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
// MARK: -Helpers

extension MusicViewController {
  
  private func style(){
    collectionView.register(MusicCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  }
  private func layout(){
    
    let appearance = UICollectionViewFlowLayout()
    appearance.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    appearance.minimumInteritemSpacing = 10
    appearance.minimumLineSpacing = 10

    let screenWidth = UIScreen.main.bounds.width
    let itemWidth = (screenWidth - 30 )/2
    
    appearance.itemSize = CGSize(width: itemWidth, height: itemWidth*1.1)
    collectionView.collectionViewLayout = appearance

  }
}
// MARK: -UICollectionViewDataSource

extension MusicViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return musicResult.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicCell
    cell.result = self.musicResult[indexPath.row]
    return cell
  }
}
// MARK: -UICollectionViewDelegate
extension MusicViewController {
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailController = CategoryDetailViewController()
    detailController.itemId = (musicResult[indexPath.row].id!)
    detailController.categoryName = (musicResult[indexPath.row].name!)
    self.navigationController?.pushViewController(detailController, animated: true)

  }
}
