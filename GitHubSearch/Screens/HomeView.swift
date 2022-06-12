//
//  HomeView.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: HomeViewModel = .init(apiService: APIService())
    @State private var text = ""
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                if viewModel.isLoading {
                    Text("Loading...")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .offset(x: 0, y: -200)
                        .navigationBarTitle("", displayMode: .inline)
                } else {
//                    ScrollView(showsIndicators: false) {
//                        ForEach
//                    }
                }
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    TextField("Search...",
                              text: $text,
                              onCommit: {

                    })
                })
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
