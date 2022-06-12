//
//  HomeViewModel.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-12.
//

import Foundation
import Combine
import UIKit

final class HomeViewModel: ObservableObject {
    
    // MARK: - Input
    enum Inputs {
        // User finished to input
        case onCommit(text: String)
        case tappedCardView(urlString: String)
    }
    
    // MARK: - Output
    // CardView.Input - repository information
    @Published private(set) var cardViewInputs: [CardView.Input]
    // text in text field
    @Published var inputText: String = ""
    @Published var isShowError = false
    @Published var isLoading = false
    @Published var isShowSheet = false
    @Published var repositoryUrl: String = ""
    
    
    // MARK: - Properties
    private let apiService: APIServiceType
    // A subject emits the event when a user has done input
    private let onCommitSubject = PassthroughSubject<String, Never>()
    // A subject emits the event when the search has done
    private let responseSubject = PassthroughSubject<SearchRepositoryResponse, Never>()
    // A subject emits the event when an error occurs
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private var cancellables: [AnyCancellable] = []
    
    private func bind() {
        let responseSubscriber = onCommitSubject
            .flatMap(<#T##transform: (String) -> Publisher##(String) -> Publisher#>)
    }
    
    init(apiService: APIServiceType) {
        self.apiService = apiService
        bind()
    }
}
