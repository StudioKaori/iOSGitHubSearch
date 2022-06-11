//
//  APIService.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation
import Combine

protocol APIServiceType {
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}
