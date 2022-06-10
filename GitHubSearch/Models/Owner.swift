//
//  Owner.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation

struct Owner: Decodable, Hashable, Identifiable {
    let id: Int
    let avatarUrl: String
}
