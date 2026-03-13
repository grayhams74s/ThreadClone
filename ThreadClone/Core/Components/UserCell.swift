//
//  UserCell.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImage(profilepic: user.profileImage ?? "")
            
            HStack {
                VStack (alignment: .leading ,spacing: 3){
                    Text(user.username)
                        .fontWeight(.semibold)
                    Text("Full Name")
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 24)
                        .foregroundStyle(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
           
                
            }
            
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
}

#Preview {
    UserCell(user: User.mockUsers)
}
