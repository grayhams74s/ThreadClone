//
//  ProfileView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    @Environment(\.dismiss) var dismiss
    @State var viewModel = ProfileeViewModel()
    
    let user: User
    
    var body: some View {
            ScrollView (showsIndicators: false) {
                VStack(alignment: .center, spacing: 12) {
                    // Top View
                    UserProfile(userProfile: user)
                    //Button
                    FollowButton()
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
                     })
                
            }
        
        
    }
}

#Preview {
    ProfileView(user: User.mockUsers)
}
