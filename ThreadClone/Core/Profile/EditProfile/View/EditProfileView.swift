//
//  EditProfileView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var isEnable = false
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack (alignment: .leading, spacing: 15){
                    // First Line
                    HStack {
                        VStack (alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            TextField("Enter your email", text: $viewModel.currentUseremail)
                                .font(.subheadline)

                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedImage) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                                    .clipped()
                                
                            } else {
                                CircularProfileImage(profilepic: viewModel.currentUserImageURL )
                            }
                        }
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack (alignment: .leading){
                            Text("Bio")
                                .fontWeight(.semibold)
                            TextField("Enter your bio", text: $viewModel.currentUserbio)
                                .font(.subheadline)
                        }
                        Spacer()
                    
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack (alignment: .leading){
                            Text("Link")
                                .fontWeight(.semibold)
                            Text("John Sign")
                                .font(.subheadline)
                        }
                        Spacer()
            
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack (alignment: .leading){
                        
                            Text("Private Profile")
                                .font(.subheadline)
                        }
                        Spacer()
                        Toggle("", isOn: $isEnable)
                                     
                    }
                    
                }
                .padding()
                .background(.white)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                      .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem (placement: .navigationBarLeading){
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundColor(.black)
                    }
                    
                    ToolbarItem (placement: .topBarTrailing){
                        Button("Done") {
                            Task {
                                try await viewModel.updateUserData()
                                dismiss()
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 18)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
      
    }
}

#Preview {
    EditProfileView()
}
