//
//  AlbumViewController.swift
//  deezerApp
//
//  Created by Burak Kara on 13.05.2023.
//

import UIKit
import Alamofire
import AVKit

private let reuseIdentifier = "AlbumCell"


class AlbumViewController : UITableViewController {
  
 //MARK: -Properties
  
  var isPlaying = false
  var albumId:Int?
  var songName:String?
  var songResult:[SongDetailTracks] = [] {
    didSet{tableView.reloadData()}
  }
  private let player:AVPlayer = {
    let player = AVPlayer()
    return player
  }()

 //MARK: -Lifecycle
  override func viewDidLoad() {
        super.viewDidLoad()
    style()
    layout()

    }
  override func viewWillAppear(_ animated: Bool) {
    Service.fetchArtistSongById(albumId: "\(albumId!)") { result in
             self.songResult = result
    }
    navigationItem.title = songName
  }
}

// MARK: -Helpers

extension AlbumViewController {
  
  private func style(){
    tableView.register(AlbumCell.self, forCellReuseIdentifier: reuseIdentifier)
  }
  private func layout(){
    
  }
}
// MARK: -UICollectionViewDataSource

extension AlbumViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songResult.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as! AlbumCell
    cell.result = self.songResult[indexPath.row]
    return cell
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 125
  }
  

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let urlPreview = songResult[indexPath.row].preview
    if let urlString = urlPreview, let url = URL(string: urlString) {
      let playerItem = AVPlayerItem(url:url)
      player.replaceCurrentItem(with: playerItem)
      if isPlaying {
        player.pause()
        isPlaying = false
      } else {
        player.play()
        isPlaying = true
      }
    }

  }

}

