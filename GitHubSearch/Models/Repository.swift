//
//  Repository.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation

struct Repository: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    let language: String?
    let htmlUrl: String
    let owner: Owner
}
