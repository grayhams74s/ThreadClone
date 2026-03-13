//
//  LoginView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct LoginView: View {
    
    
    fileprivate var textFieldUI: some View {
        VStack {
            TextField("Enter your email", text: $viewModel.email)
                .modifier(ThreadsTextFieldModifier())
            
            SecureField("Enter your password", text: $viewModel.password)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
        }
        .padding(.horizontal)
    }
    
    fileprivate var forgotPasswordUI: some View {
        NavigationLink {
            Text("Forgot Password")
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 28)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    fileprivate var signInUI: some View {
        
        
        Button {
            Task {
                try await viewModel.loginUser()
            }
        } label: {
            Text("Login")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 352, height: 44)
                .background(.black)
                .cornerRadius(8)
                .padding(.top, 20)
        }
    }
    
    fileprivate var dontHaveAnAccountUI: some View {
        HStack (alignment: .center){
            Text("Don't have an account?")
                .font(.system(size: 14))
                .font(.footnote)
                .padding(.top)
                .foregroundStyle(.black)
        
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .foregroundStyle(.black)
                   
            }

        }
        .padding(.vertical)
    }
    
    
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("thread-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                if !viewModel.isLoading {
                    textFieldUI
                    forgotPasswordUI
                    signInUI
                } else {
                    ProgressView("Signing in...")
                        .padding(.top, 20)
                }
                
                Spacer()
                
                if !viewModel.isLoading {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 1)
                        .padding(.top, 40)
                        dontHaveAnAccountUI
                    }
                
                }
            
            
            .alert("Something Went Wrong", isPresented: $viewModel.presentAlert) {
                Button("OK") {
                    viewModel.presentAlert = false
                  }
              } message: {
                  Text(viewModel.errorMessage)
              }
        }
        
    }
}

#Preview {
    LoginView()
}
