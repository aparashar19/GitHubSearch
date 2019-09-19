//
//  UserInfoViewController.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/19/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//


import UIKit

class UserInfoViewController: UIViewController {
    var userInfo :GitHubUser?
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var joinDate: UILabel!
    @IBOutlet var followers: UILabel!
    @IBOutlet var following: UILabel!
    @IBOutlet var repoSearchBar: UISearchBar!
    @IBOutlet var repoTableView: UITableView!
    
    override func viewDidLoad() {
        if let gimage = userInfo?.avatarUrl {
            let data = try? Data(contentsOf: gimage)
            let image: UIImage? = UIImage(data: data!)
            
            if let img = image {
                self.userImage?.image = img
            }
            
            if let uname=userInfo?.name {
                self.userName?.text = uname
            }
        }
        
    }
    
        override func viewWillAppear(_ animated: Bool) {
        if let gimage = userInfo?.avatarUrl {
            let data = try? Data(contentsOf: gimage)
            let image: UIImage? = UIImage(data: data!)
            
            if let img = image {
                self.userImage?.image = img
            }
            
            if let uname=userInfo?.name {
                self.userName?.text = uname
            }
            if let email = userInfo?.email {
                self.email?.text = email
            }
            if let location = userInfo?.location {
                self.location?.text = location
            }
            if let followers = userInfo?.followers {
                let followersNo = (followers as NSNumber).stringValue
                self.followers?.text = "\(followersNo) Followers"
            }
            if let following = userInfo?.following {
                let followingNo = (following as NSNumber).stringValue
                self.followers?.text = "Following \(followingNo)"
            }
            
        }
    }
}
