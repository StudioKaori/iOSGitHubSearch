//
//  CardView.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import SwiftUI

struct CardView: View {
    
    // To use foreach, use Identifiable
    struct Input: Identifiable {
        let id: UUID = UUID()
        let iconImage: UIImage
        let title: String
        let language: String?
        let star: Int
        let description: String?
        let url: String
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
