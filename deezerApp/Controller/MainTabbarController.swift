//
//  MainTabbarController.swift
//  deezerApp
//
//  Created by Burak Kara on 8.05.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
  override func viewDidLoad(){
    super.viewDidLoad()
   setup()
  }
  
}
// MARK: -Helpers

extension MainTabBarController {
    private func setup(){
      viewControllers = [
       createViewController(rootViewController: MusicViewController(), title: "Music", imageName: "music.note"),
        createViewController(rootViewController: FavoriteViewController(), title: "Favorites", imageName: "heart")

      ]
    }
  private func createViewController(rootViewController: UIViewController,title:String,imageName:String) ->UINavigationController{
    
    rootViewController.title = title
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    let controller = UINavigationController(rootViewController: rootViewController)
    controller.navigationBar.prefersLargeTitles = true
    controller.navigationBar.compactAppearance = appearance
    controller.navigationBar.standardAppearance = appearance
    controller.navigationBar.scrollEdgeAppearance = appearance
    controller.navigationBar.compactAppearance = appearance
    controller.tabBarItem.title = title
    controller.tabBarItem.image = UIImage(systemName: imageName)
    return controller
  }
  }

