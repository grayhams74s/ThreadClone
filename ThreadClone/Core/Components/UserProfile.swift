//
//  UserProfile.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    
    var userProfile: User
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 9) {
                Text(userProfile.username)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(userProfile.fullname)
                    .font(.subheadline)
                
                if userProfile.bio == "" {
            
                } else {
                    Text(userProfile.bio)
                        .font(.footnote)
                        .padding(.top, 4)
                }
                                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 8)
                  
            }
            
            Spacer()
            
            KFImage(URL(string: userProfile.profileImage ?? ""))
                .placeholder {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                }
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .contentShape(Circle())
                .clipped()
        }
    }
}

#Preview {
    UserProfile(userProfile: User.mockUsers)
}
