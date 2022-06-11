//
//  APIServiceError.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-11.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
