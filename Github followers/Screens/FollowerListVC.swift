//
//  FollowerListVC.swift
//  Github followers
//
//  Created by Meruert on 24.04.2023.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad studd", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print("\(followers.count)")
            print(followers)
            
        }
        print("d")
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
