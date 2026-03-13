//
//  FeedView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct FeedView: View {
    
    @State var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.users) { user in
                    ThreadCell(user: user)
                }
            }
            .refreshable {
                print("Refreshed!")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
       
    }
}

#Preview {
    FeedView()
}
