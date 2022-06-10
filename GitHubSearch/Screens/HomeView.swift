//
//  HomeView.swift
//  GitHubSearch
//
//  Created by Kaori Persson on 2022-06-10.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    //@StateObject private var viewModel:
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
//                    TextField("Search...",
//                              text: $text,
//                              onCommit: {
//                        
//                    })
                })
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
