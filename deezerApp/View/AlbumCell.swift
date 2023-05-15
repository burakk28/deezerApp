//
//  AlbumCell.swift
//  deezerApp
//
//  Created by Burak Kara on 14.05.2023.
//

import UIKit
import Kingfisher

class AlbumCell : UITableViewCell {
  
   // MARK: -Properties
  var result:SongDetailTracks?{
  didSet {configure()}
}

  private var isFavorite = false {
    didSet{
      setupFavButton()
    }
  }
  private var resultCoreDataItems:[DeezerCoreData] = [] {
    didSet {
      let isValue = resultCoreDataItems.contains(where:{$0.id == result!.id ?? 0})
      if isValue {
        isFavorite = true
      }else{
        isFavorite = false
      }
    }
  }
  
  private let albumImageView: UIImageView = {
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
  return button
  }()

   // MARK: -Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    super.init(style:style,reuseIdentifier:reuseIdentifier)
    
    layout()
    configure()
    setupFavButton()
    //fetchCoreData()

  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
 // MARK: -Selectors

extension AlbumCell {

  
  @objc private func favButtonTapped() {
    print("Fav button tapped!")
    isFavorite = true
    if isFavorite {
      deleteCoreData()
    }else {
      addCoreData()
    }
  }
}
 // MARK: -Helpers
extension AlbumCell {
  
 private func deleteCoreData(){
   CoreDataController.deleteCoreData(array: resultCoreDataItems, song: self.result!)
  self.isFavorite = false
}

  private func addCoreData(){
    let model = DeezerCoreData(context: context)
    CoreDataController.addCoreData(model: model, song: self.result!)
    self.isFavorite = true
  }
  private func fetchCoreData(){
    let fetchRequest = DeezerCoreData.fetchRequest()
    CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
      self.resultCoreDataItems = result
    }
  }
  private func setupFavButton(){
    if isFavorite {
      favButton.addTarget(self, action: #selector(favButtonTapped),for: .touchUpInside)
      self.favButton.setImage(UIImage(systemName: "heart"),for:.normal)
    }else {
      favButton.addTarget(self, action: #selector(favButtonTapped),for: .touchUpInside)
      favButton.setImage(UIImage(systemName: "heart.fill"),for:.normal)
    }
  }
}
extension AlbumCell{
  
  private func layout(){

    addSubview(albumImageView)
    addSubview(songTitleLabel)
    contentView.addSubview(favButton)
    
    albumImageView.translatesAutoresizingMaskIntoConstraints = false
    songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    favButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      //albumImageView
      albumImageView.heightAnchor.constraint(equalToConstant: 50),
      albumImageView.widthAnchor.constraint(equalToConstant: 50),
      albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
      albumImageView.topAnchor.constraint(equalTo: topAnchor,constant: 50),
      //favButton
      favButton.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor,constant: 250),
      favButton.topAnchor.constraint(equalTo: centerYAnchor),
      //songTitleLabel
      songTitleLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor,constant: 30),
      songTitleLabel.topAnchor.constraint(equalTo: centerYAnchor),
      songTitleLabel.trailingAnchor.constraint(equalTo: favButton.leadingAnchor,constant: 10)

    ])
  }
  private func configure(){
    guard let result = self.result else {return }
    let songDetailViewModel = SongDetailViewModel(songDetail: result)
    songTitleLabel.text = songDetailViewModel.title
    
  }
}
