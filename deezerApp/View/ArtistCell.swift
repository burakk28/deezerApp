//
//  ArtistCell.swift
//  deezerApp
//
//  Created by Burak Kara on 11.05.2023.
//


import UIKit

class ArtistCell : UITableViewCell {
  
   // MARK: -Properties
  
  var result:ArtistAlbum?{
    didSet {configure()}
  }
  
  private var stackView:UIStackView!
  private let albumImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.backgroundColor = .systemBlue
    return imageView
  }()
  private let albumTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16)
    label.text = "AlbumTitleLabel"
    return label
  }()
  private let albumReleaseDateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16)
    label.text = "albumReleaseDateLabel"
    return label
  }()

   // MARK: -Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style:style,reuseIdentifier:reuseIdentifier)
    setup()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
 // MARK: -Helpers
extension ArtistCell{
  
  private func setup(){

    albumImageView.translatesAutoresizingMaskIntoConstraints = false
    stackView = UIStackView(arrangedSubviews: [albumTitleLabel,albumReleaseDateLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
  }
  
  private func layout(){
    
    addSubview(stackView)
    addSubview(albumImageView)
    
    NSLayoutConstraint.activate([
      albumImageView.heightAnchor.constraint(equalToConstant: 100),
      albumImageView.widthAnchor.constraint(equalToConstant: 100),
      albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo:albumImageView.trailingAnchor,constant: 10),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
      
    ])

  }
  
  private func configure(){
    guard let result = self.result else {return}
    let artistAlbumViewModel = ArtistAlbumViewModel(artistAlbum: result)
    albumImageView.kf.setImage(with: artistAlbumViewModel.coverMedium)
    albumTitleLabel.text = artistAlbumViewModel.title
    albumReleaseDateLabel.text = artistAlbumViewModel.releaseDate   
    
  }
}
