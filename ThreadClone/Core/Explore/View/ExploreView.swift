//
//  ExploreView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""
    @State var viewModel = ExploreViewModel()

    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                                Divider()
                                    .padding(.horizontal, 30)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            
            .navigationTitle("Search")
            .searchable(text: $searchText, placement: .automatic, prompt: "Search")
        }
        .refreshable {
            print("Refreshed!")
        }
    }
}

#Preview {
    ExploreView()
}
