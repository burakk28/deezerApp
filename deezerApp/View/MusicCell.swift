//
//  MusicCell.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import UIKit
import Kingfisher

class MusicCell: UICollectionViewCell {
  
  // MARK: -Properties
  
  var result:MusicMain?{
    didSet {configure()}
  }
  
  private let musicImageView:UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemPurple
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  private let musicNameLabel : UILabel = {
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
extension MusicCell {
 
  private func setup(){
    musicImageView.translatesAutoresizingMaskIntoConstraints = false
    musicImageView.layer.cornerRadius = 10
    musicNameLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  private func layout(){
    addSubview(musicImageView)
    addSubview(musicNameLabel)
    NSLayoutConstraint.activate([
      
      musicImageView.heightAnchor.constraint(equalToConstant: 175),
      musicImageView.widthAnchor.constraint(equalToConstant: 150),
      musicImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      musicImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),

      musicNameLabel.topAnchor.constraint(equalTo: musicImageView.bottomAnchor,constant: 4),
      musicNameLabel.centerXAnchor.constraint(equalTo: musicImageView.centerXAnchor)
    
    ])
  }
  
  private func configure(){
    guard let result = self.result else {return }
    let musicViewModel = MusicViewModel(musicMain: result)
    musicNameLabel.text = musicViewModel.musicName
    musicImageView.kf.setImage(with: musicViewModel.picture_medium)
  }
}
