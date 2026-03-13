//
//  ProfileView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    @State var viewModel = ProfileeViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View { 
    
        NavigationStack {
            ScrollView (showsIndicators: false) {
                VStack(alignment: .center, spacing: 12) {
                    // Top View
                    UserProfile(userProfile: viewModel.currentUser ?? User.mockUsers)
                    //Button
                    ProfileButtons(viewModel: $viewModel)
                    // Selector
                    VStack {
                        GeometryReader { proxy in
                            let width = proxy.size.width
                            let count = CGFloat(ProfileThreadFilter.allCases.count)
                            let filterBarWidth = width / count - 0

                            HStack(alignment: .center) {
                                ForEach(ProfileThreadFilter.allCases) { filter in
                                    VStack {
                                        Text(filter.title)
                                            .font(.subheadline)
                                            .fontWeight(selectedFilter == filter ? .bold : .semibold)
                                            .foregroundStyle(selectedFilter == filter ? Color.black : Color.gray)

                                        if selectedFilter == filter {
                                            Rectangle()
                                                .foregroundColor(.black)
                                                .frame(width: filterBarWidth, height: 1)
                                                .matchedGeometryEffect(id: "item", in: animation)
                                        } else {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: filterBarWidth, height: 1)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedFilter = filter
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 30) // give the geometry reader a height just for measurement
                    }
                    .padding(.top, 20)
                    //LazyVStack
                    LazyVStack {
                     
                    }
                     
                }
                .padding(.horizontal, 14)
                .sheet(isPresented: $viewModel.isEditing, content: {
                         EditProfileView()
                        .environment(viewModel)
                     })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
