//
//  FavoriteCell.swift
//  deezerApp
//
//  Created by Burak Kara on 15.05.2023.
//

import UIKit

class FavoriteCell: UITableViewCell {
  
  // MARK: -Properties
  
  private let favoriteImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(systemName: "music.quarternote.3")
    return imageView
  }()
  private let songTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16)
    label.text = "AlbumTitleLabel"
    label.numberOfLines = 3
    return label
  }()
  private lazy var favButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "heart"), for: .normal)
    button.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
    button.addTarget(self, action: #selector(favButtonTapped),for: .touchUpInside)
    contentView.addSubview(button)
    return button
  }()
  
  
  // MARK: -Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    super.init(style:style,reuseIdentifier:reuseIdentifier)
    layout()
//    configure()
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  @objc private func favButtonTapped() {
    print("Fav button tapped!")
  }
}
extension FavoriteCell{
  
  private func layout(){

    addSubview(favoriteImageView)
    addSubview(songTitleLabel)

    
    favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
    songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    favButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      //favoriteImageView
      favoriteImageView.heightAnchor.constraint(equalToConstant: 50),
      favoriteImageView.widthAnchor.constraint(equalToConstant: 50),
      favoriteImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
      favoriteImageView.topAnchor.constraint(equalTo: topAnchor,constant: 50),
      //favButton
      favButton.leadingAnchor.constraint(equalTo: favoriteImageView.trailingAnchor,constant: 250),
      favButton.topAnchor.constraint(equalTo: centerYAnchor),
      //songTitleLabel
      songTitleLabel.leadingAnchor.constraint(equalTo: favoriteImageView.trailingAnchor,constant: 30),
      songTitleLabel.topAnchor.constraint(equalTo: centerYAnchor),
      songTitleLabel.trailingAnchor.constraint(equalTo: favButton.leadingAnchor,constant: 10)

    ])
   
  }
//  private func configure(){
//    guard let result = self.result else {return }
//    let songDetailViewModel = SongDetailViewModel(songDetail: result)
//    songTitleLabel.text = songDetailViewModel.title
//  }
}
