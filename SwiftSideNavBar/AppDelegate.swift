//
//  AppDelegate.swift
//  SwiftSideNavBar
//
//  Created by MacBook on 1/10/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var greenViewControllers = GreenViewController()
    var redViewControllers = RedViewController()
    
    var greenNav:  UINavigationController!
    var redNav: UINavigationController!
    var menuNav: UINavigationController!
    
    var sidebarVC: SidebarViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupVC()
        
        return true
    }
    
    func setupVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        greenViewControllers = storyboard.instantiateViewController(withIdentifier: "GreenVC") as! GreenViewController
        greenViewControllers.delegate = self
    
        greenNav = UINavigationController(rootViewController: greenViewControllers)
        
        redViewControllers = storyboard.instantiateViewController(withIdentifier: "RedVC") as! RedViewController
        redViewControllers.delegate = self
        
        redNav = UINavigationController(rootViewController: redViewControllers)
        
        
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuTableViewController
        menuVC.delegate = self
        menuNav = UINavigationController(rootViewController: menuVC)
        
        sidebarVC = SidebarViewController(leftViewController: menuNav, mainViewController: greenNav, overlap: 70)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = sidebarVC
        window?.makeKeyAndVisible()
    }
}


extension AppDelegate: GreenViewControllerDelegate,RedViewControllerDelegate{
    func redViewControllerDidTapMenuButton(_ controller: RedViewController) {
        sidebarVC.toggleLeftAnimated(true)
    }
    
    
    func greenViewControllerDidTapMenuButton(_ controller: GreenViewController) {
        sidebarVC.toggleLeftAnimated(true)
    }
}

extension AppDelegate: MenuTableViewControllerDelegate{
   
    func menuTableViewController(_ controller: MenuTableViewController, didSelectRow row: Int) {
        
        sidebarVC.closeMenuAnimated(true)
        
        var destinationViewController: UIViewController!
        switch row {
        case 0:
            destinationViewController = greenViewControllers
        case 1:
            destinationViewController = redViewControllers
        default:
            print("implement others")
        }
    
        greenNav.setViewControllers([destinationViewController], animated: true)
  
        
    }
    
    
}
