//
//  CoreData.swift
//  deezerApp
//
//  Created by Burak Kara on 15.05.2023.
//

import Foundation
import CoreData
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

let context = appDelegate.persistentContainer.viewContext

struct CoreDataController {
  
  static func addCoreData(model:DeezerCoreData,song:SongDetailTracks){
    model.id = (Int64(song.id!))
    model.title = song.title!
    appDelegate.saveContext()
  }
  static func deleteCoreData(array:[DeezerCoreData],song:SongDetailTracks){
    let value = array.filter({$0.id == song.id!})
    context.delete(value.first!)
  }
  static func fetchCoreData(fetchRequest: NSFetchRequest<DeezerCoreData>,completion:@escaping([DeezerCoreData])->Void){
    do{
      let result = try context.fetch(fetchRequest)
      completion(result)
    }catch{
      print(error.localizedDescription)
    }
  }
}
