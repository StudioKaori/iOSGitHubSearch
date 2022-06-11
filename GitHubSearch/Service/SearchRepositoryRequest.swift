//
//  SearchRepositoryRequest.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation

struct SearchRepositoryRequest: APIRequestType {
    
    private let query: String
    
    init(query: String) {
        self.query = query
    }
    
    typealias Response = SearchRepositoryResponse
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
            .init(name: "order", value: "desc")
        ]
    }
    
}
