//
//  GitHubUser.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/18/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//

import Foundation

struct GitHubUser : Codable{
    var name : String?
    var noOfRepos : Int?
    var avatarUrl : URL?
    var email : String?
    var location : String?
    var followers : Int?
    var following : Int?

    
    private enum CodingKeys: String, CodingKey {
        case name
        case noOfRepos = "public_repos"
        case avatarUrl = "avatar_url"
        case email
        case location
        case followers
        case following
        
        
    }
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
    
}
