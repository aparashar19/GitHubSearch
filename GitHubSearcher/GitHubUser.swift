//
//  GitHubUser.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/18/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//

import Foundation

class GitHubUser{
    var userName : String
    var noOfRepos : Int
    var avatarImg : Data
    
    init(userName:String,noOfRepos:Int,avatarImg:Data) {
        //
        self.userName = userName
        self.noOfRepos = noOfRepos
        self.avatarImg = avatarImg
    }
    
}
