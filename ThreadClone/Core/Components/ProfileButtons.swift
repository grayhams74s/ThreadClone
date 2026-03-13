//
//  ProfileButtons.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import SwiftUI

struct ProfileButtons: View {
    
    @Binding var viewModel: ProfileeViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.isEditing = true
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            
            Button {
                
            } label: {
                Text("Share Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
        }
        .padding(.top, 6)
    }
}

#Preview {
    ProfileButtons(viewModel: .constant(ProfileeViewModel()))
}
