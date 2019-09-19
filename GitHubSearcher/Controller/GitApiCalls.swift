//
//  GitApiCalls.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/18/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//

import Foundation

class gitApiCalls{
/*        guard let gitUrl = URL(string: "https://api.github.com/users/") else { return GitHubUser(name: "test",noOfRepos: 0,avatarUrl: nil) }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHubUser.self, from: data)
                
                print("gitData is \(gitData)")
                var users : GitHubUser
                
//                if let gimage = gitData.avatarUrl {
//                    let data = try? Data(contentsOf: gimage)
//                    let image: UIImage = UIImage(data: data!)!
//                    self.avatarImg = image
//                    users.avatarUrl = gitData.avatarUrl
//                }
                
                if let gname = gitData.name {
                    users.name = gname
                }
                DispatchQueue.main.sync {
                    if let gimage = gitData.avatarUrl {
                        let data = try? Data(contentsOf: gimage)
                        let image: UIImage = UIImage(data: data!)!
                        self.avatarImg = image
                    }
                    
                    
                    if let gname = gitData.name {
                        self.username = gname
                    }
                    
                    
                    if let grepos = gitData.noOfRepos {
                        self.repos = String(grepos)
                    }
                    self.userTableView.reloadData()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }*/
}
