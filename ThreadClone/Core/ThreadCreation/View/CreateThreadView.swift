//
//  CreateThreadView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct CreateThreadView: View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: CreateThreadViewModel
    
    private var user: User? {
        return UserService.shared.CurrentUser
    }
    

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 4){
                HStack {
                    CircularProfileImage(profilepic: user?.profileImage ?? "")
                    VStack(alignment: .leading) {
                        Text("John_Sign374")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $viewModel.caption)
                    }
                    
                }
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        dismiss()
                        Task {
                            try await viewModel.uploadThread()
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView(viewModel: CreateThreadViewModel())
}
