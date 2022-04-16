//
//  AppDelegate.swift
//  24.3 MVC ToDoList
//
//  Created by Vasily on 11.04.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        //        Установка вручную стартового вью контроллера и навигейшн контроллера
         let rootControoler = UINavigationController(rootViewController: ViewController())
         window?.rootViewController = rootControoler
        window?.makeKeyAndVisible()
         
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}

