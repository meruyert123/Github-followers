//
//  User.swift
//  Github followers
//
//  Created by Meruert on 26.04.2023.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var following: Int
    var followers: Int
    var createdAt: String
}
