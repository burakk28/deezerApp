//
//  ArtistViewController.swift
//  deezerApp
//
//  Created by Burak Kara on 11.05.2023.
//

import UIKit

private let reuseIdentifier = "ArtistCell"

class ArtistViewController:UIViewController {

  //MARK: -Properties
  
  var artistId : Int?
  
  var result:ArtistModel?{
    didSet {
      configure()
    }
  }
  var artistAlbums: [ArtistAlbum] = [] {
    didSet{artistTableView.reloadData()
    }
  }
  private let artistStackView = UIStackView()
  private let artistTableView = UITableView()
  private let artistImageView = UIImageView()
  // MARK: -Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    style()
    layout()
    view.backgroundColor = UIColor.white
    artistTableView.delegate = self
    artistTableView.dataSource = self

  }

  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    configure()
    
    Service.fetchArtistDetailById(artistId: "\(artistId!)") { result in
        self.result = result
      }
    Service.fetchArtistAlbumsById(artistId: "\(artistId!))") { albums in
      self.artistAlbums = albums
    }
  }
}

  // MARK: -Helpers
extension ArtistViewController {
  
  private func setup(){
    artistTableView.dataSource = self
    artistTableView.register(ArtistCell.self, forCellReuseIdentifier: reuseIdentifier)
  }
  private func style(){
    
    artistStackView.translatesAutoresizingMaskIntoConstraints = false
    artistStackView.axis = .vertical
    artistStackView.spacing = 8

    artistTableView.frame = artistStackView.bounds
    
    artistImageView.translatesAutoresizingMaskIntoConstraints = false
    artistImageView.contentMode = .scaleAspectFit

  }
  
  private func layout() {
      view.addSubview(artistStackView)
      artistStackView.addArrangedSubview(artistImageView)
      artistStackView.addArrangedSubview(artistTableView)
      
      NSLayoutConstraint.activate([
        
          //artistStackView
          artistStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
          artistStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
          artistStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -4),
          artistStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
          //artistImageView
          artistImageView.widthAnchor.constraint(equalToConstant: 250),
          artistImageView.heightAnchor.constraint(equalToConstant: 250 ),
          //artistTableView
          artistTableView.widthAnchor.constraint(equalTo: artistStackView.widthAnchor),
          
      ])
  }
  
  private func configure(){
      guard let result = self.result else {return}
      let artistViewModel = ArtistViewModel(artistModel: result)
      artistImageView.kf.setImage(with: artistViewModel.picture)
      navigationItem.title = artistViewModel.name
  }
  }
 // MARK: -UITableViewDataSource

extension ArtistViewController:UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.artistAlbums.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as! ArtistCell
    cell.result = self.artistAlbums[indexPath.row]
    return cell
  }
}

 // MARK: -UITableViewDelegate
extension ArtistViewController:UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let albumController = AlbumViewController()
    albumController.albumId = (artistAlbums[indexPath.row].id!)
    albumController.songName = (artistAlbums[indexPath.row].title!)
    self.navigationController?.pushViewController(albumController, animated: true)
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 125
  }
}
