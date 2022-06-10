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
    
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(uiImage: input.iconImage)
                // not to change the color
                .renderingMode(.original)
                .resizable()
                // Keep the aspect ration
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                // Add border line
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
