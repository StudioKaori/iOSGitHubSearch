//
//  SearchRepositoryResponse.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    let items: [Repository]
}
