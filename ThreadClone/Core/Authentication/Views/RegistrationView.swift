//
//  RegistrationView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct RegistrationView: View {
    @State var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    fileprivate var textFieldUI: some View {
        VStack {
            TextField("Enter your email", text: $viewModel.email)
                .modifier(ThreadsTextFieldModifier())
    
            
            SecureField("Enter your password", text: $viewModel.password)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            TextField("Enter your fullname", text: $viewModel.fullname)
                .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $viewModel.username)
                .modifier(ThreadsTextFieldModifier())
            
        }
        .padding(.horizontal)
    }
    
    fileprivate var signUpButton: some View {
        Button {
            Task {
                try await viewModel.createUser()
            }
        } label: {
            if viewModel.isLoading {
                HStack {
                    ProgressView("Creating your account")
                        .padding(.top, 20)
                }

            } else {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
                    .padding(.top, 20)
                }
            }
    }
    
    fileprivate var haveAnAccountUI: some View {
        HStack (alignment: .center){
            Text("Have an account?")
                .font(.system(size: 14))
                .font(.footnote)
                .padding(.top)
                .foregroundStyle(.black)
        
            Button {
                dismiss()
            } label: {
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .foregroundStyle(.black)
                   
            }

        }
        .padding(.vertical)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("thread-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            if !viewModel.isLoading {
                textFieldUI
            }
            
            signUpButton
    
            Spacer()
            
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
                .padding(.top, 40)
            
            haveAnAccountUI
            
        }
        .navigationBarBackButtonHidden(true)

    }
    
}

#Preview {
    RegistrationView()
}
