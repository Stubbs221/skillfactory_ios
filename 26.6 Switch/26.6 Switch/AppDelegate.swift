//
//  AppDelegate.swift
//  26.6 Switch
//
//  Created by Vasily on 25.04.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        //        Установка вручную стартового вью контроллера и навигейшн контроллера
         
         window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
         
        
        return true
    }

}
