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
}
