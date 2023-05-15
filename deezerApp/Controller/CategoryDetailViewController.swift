//
//  CategoryDetailViewController.swift
//  deezerApp
//
//  Created by Burak Kara on 10.05.2023.
//

import UIKit
import Alamofire

private let reuseIdentifier = "CategoryDetail"

class CategoryDetailViewController : UICollectionViewController {

// MARK: -Properties
  
  var itemId : Int?
  var categoryName:String?
 
  var categoryDetailResult:[CategoryDetail] = [] {
    didSet{collectionView.reloadData()}
  }
// MARK: -Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    }
  override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
      Service.fetchArtistData(genre_id:"\(itemId!))") { result in
        self.categoryDetailResult = result
          }
    navigationItem.title = categoryName
      }
  init(){
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
         layout()
     }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
// MARK: -Helpers

extension CategoryDetailViewController {
  
  private func style(){
    collectionView.register(CategoryDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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

extension CategoryDetailViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryDetailResult.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryDetailCell
    cell.result = self.categoryDetailResult[indexPath.row]
    return cell
  }
}
// MARK: -UICollectionViewDelegate
extension CategoryDetailViewController {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let artistController = ArtistViewController()
    artistController.artistId = (categoryDetailResult[indexPath.row].id!)
   self.navigationController?.pushViewController(artistController, animated: true)
  }
}
