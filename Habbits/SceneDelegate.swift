//
//  SceneDelegate.swift
//  Habbits
//
//  Created by Никита Васильев on 11.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let habitsViewController = HabitsViewController()
        let infoViewController = InfoViewController()
        
        let habitsNavViewController = UINavigationController(rootViewController: habitsViewController)
        let infoNavViewController = UINavigationController(rootViewController: infoViewController)
        
        habitsNavViewController.tabBarItem.title = "Привычки"
        habitsNavViewController.tabBarItem.image = UIImage(named: "person.circle.fill")
        
        infoNavViewController.tabBarItem.title = "Информация"
        infoNavViewController.tabBarItem.image = UIImage(named: "cursorarrow.and.square.on.square.dashed")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [habitsNavViewController, infoNavViewController]
        tabBarController.tabBar.backgroundColor = .white
        
   
        
        window.backgroundColor = .white
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
        
    }
}

