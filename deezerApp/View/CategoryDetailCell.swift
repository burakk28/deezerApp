//
//  CategoryDetailCell.swift
//  deezerApp
//
//  Created by Burak Kara on 10.05.2023.
//

import UIKit
import Kingfisher

class CategoryDetailCell: UICollectionViewCell {
  
  // MARK: -Properties
  
  var result:CategoryDetail?{
    didSet {configure()}
  }
  
  private let categoryImageView:UIImageView = {
    
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView

  }()
  
  private let categoryNameLabel : UILabel = {
    let nameLabel = UILabel()
    nameLabel.text = "categoryName"
    nameLabel.textColor = .black
    nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
    return nameLabel
  }()
  
  // MARK: -Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
      setup()
      layout()
      }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
 // MARK: -Helpers

extension CategoryDetailCell {

  private func setup(){
    categoryImageView.translatesAutoresizingMaskIntoConstraints = false
    categoryImageView.layer.cornerRadius = 10
    categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  private func layout(){
    
    addSubview(categoryImageView)
    addSubview(categoryNameLabel)
    
    NSLayoutConstraint.activate([
      
      categoryImageView.heightAnchor.constraint(equalToConstant: 175),
      categoryImageView.widthAnchor.constraint(equalToConstant: 150),
      categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),

      categoryNameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor,constant: 4),
      categoryNameLabel.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor)
    
    ])
    
  }
  private func configure(){
    guard let result = self.result else {return }
    let categoryDetailViewModel = CategoryDetailViewModel(categoryDetail: result)
    categoryNameLabel.text = categoryDetailViewModel.musicName
    categoryImageView.kf.setImage(with: categoryDetailViewModel.picture_medium)
  }
}
