//
//  CardView.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    
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
    
    // MARK: - Body
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
             
            Text(input.title)
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Text(input.language ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star")
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                    
                    Text(String(input.star))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            
            } //: langs and stars
            
            Text(input.description ?? "")
                .foregroundColor(.black)
                // To remove line limit, set nil
                .lineLimit(nil)
        }
        .padding(24)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .frame(minWidth: 140, minHeight: 180)
        .padding()
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input:
                .init(
                    iconImage: UIImage(systemName: "person")!,
                    title: "SwiftUI",
                    language: "Swift",
                    star: 28000,
                    description: "Declare the user interface and behavior for your app on every platform.",
                    url: "https:exmaple.com"))
        .previewLayout(.sizeThatFits)
    }
}
