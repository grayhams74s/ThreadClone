//
//  FeedView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct FeedView: View {
    
    @State var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchThreads() }
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
