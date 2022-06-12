//
//  APIService.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

// Where clause
// Using Generics with where Request: APIRequestType clause
// Specify the generics type must inherites APIRequestType (Don't need to be exact APIRequestType.)
protocol APIServiceType {
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    
    private let baseURLString: String
    
    // initialise with baseURL
    init(baseURLString: String = "https://api.github.com") {
        self.baseURLString = baseURLString
    }
    
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request : APIRequestType {
        
        guard let pathURL = URL(string: request.path, relativeTo: URL(string: baseURLString)) else {
            return Fail(error: APIServiceError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Returns publisher
        return URLSession.shared.dataTaskPublisher(for: request)
            // return data
            .map { data, urlResponse in data }
            // returns error
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError ({ (error) -> APIServiceError in
                APIServiceError.parseError(error)
            })
            // receive the stream in the main thread
            .receive(on: RunLoop.main)
            // Remove publisher type
            .eraseToAnyPublisher()
        
    }
    
}
