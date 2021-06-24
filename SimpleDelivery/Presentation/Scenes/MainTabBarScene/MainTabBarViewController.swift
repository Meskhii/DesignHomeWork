//
//  MainTabBarViewController.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
                let appearance = tabBar.standardAppearance
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
                appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
                appearance.stackedLayoutAppearance.selected.iconColor = UIColor.blue
                tabBar.standardAppearance = appearance
            } else {
                tabBar.unselectedItemTintColor = UIColor.white
                tabBar.tintColor = UIColor.blue
            }
    }
    


}
