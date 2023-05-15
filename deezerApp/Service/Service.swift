//
//  MusicService.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import Foundation
import Alamofire

class Service {
  
  private struct BaseUrl {
    
    static let baseUrl = "https://api.deezer.com"
    static let genre = "/genre"
    static let artist = "/artist/"
    static let album = "/album/"
    static let artists = "/artists"
  }
   // MARK: -fetchData
  static func fetchData(completion: @escaping ([MusicMain]) -> Void) {
    let url = BaseUrl.baseUrl + BaseUrl.genre
    AF.request(url).responseData { response in
      if let error = response.error {
        print(error.localizedDescription)
        return
      }
      guard let data = response.data else {
        return
      }
      do {
        let musicResult = try JSONDecoder().decode(MusicModel.self, from: data)
        completion(musicResult.data)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
   // MARK: -fetchArtistData
  static func fetchArtistData(genre_id: String, completion: @escaping ([CategoryDetail]) -> Void) {
    let url = "\(BaseUrl.baseUrl)\(BaseUrl.genre)/\(genre_id)\(BaseUrl.artists)"
    AF.request(url).responseData { response in
      if let error = response.error {
        print(error.localizedDescription)
        return
      }
      guard let data = response.data else {
        return
      }
      do {
        let musicResult = try JSONDecoder().decode(CategoryDetailModel.self, from: data)
        completion(musicResult.data)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
   // MARK: -fetchArtistDetailById
  static func fetchArtistDetailById(artistId: String, completion: @escaping (ArtistModel) -> Void) {
    let url = "\(BaseUrl.baseUrl)/artist/\(artistId)"
    AF.request(url).responseData { response in
      if let error = response.error {
        print(error.localizedDescription)
        return
      }
      guard let data = response.data else {
        return
      }
      do {
        let artistResult = try JSONDecoder().decode(ArtistModel.self, from: data)
        completion(artistResult)
      } catch {
        print(error.localizedDescription)
        
      }
    }
  }
   // MARK: -fetchArtistAlbumsById
  static func fetchArtistAlbumsById(artistId: String, completion: @escaping ([ArtistAlbum]) -> Void) {
    AF.request("\(BaseUrl.baseUrl)\(BaseUrl.artist)\(artistId)/albums?index=0").responseData { response in
          if let error = response.error {
              print(error.localizedDescription)
              return
          }
          guard let data = response.data else {
              return
          }
          do {
              let albumResult = try JSONDecoder().decode(ArtistAlbumModel.self, from: data)
            completion(albumResult.data)
          } catch {
              print(error.localizedDescription)
          }
      }
  }
   // MARK: -fetchArtistSongById
  static func fetchArtistSongById(albumId: String, completion: @escaping ([SongDetailTracks]) -> Void) {
   AF.request("\(BaseUrl.baseUrl)\(BaseUrl.album)\(albumId)/").responseData { response in
        if let error = response.error {
            print(error.localizedDescription)
            return
        }
        guard let data = response.data else {
            return
        }
        do {
            let songResult = try JSONDecoder().decode(SongDetailModel.self, from: data)
          completion(songResult.tracks.data)
        } catch {
            print(error.localizedDescription)
        }
      }
    }
  }
