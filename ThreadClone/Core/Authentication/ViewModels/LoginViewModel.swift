//
//  LoginViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


@Observable

class LoginViewModel {
    
    var email = ""
    var password: String = ""
    var isLoading = false
    var errorMessage = ""
    var presentAlert = false
    
    
    
    @MainActor
    func loginUser() async throws {
        isLoading = true
        do {
            let result = try await AuthService.shared.loginUser(withEmail: email, password: password)
            
            switch result {
            case .success:
                errorMessage = "Sucessfully Login!"
                presentAlert = true
                isLoading = false
            case .failure(let error):
                isLoading = false
                switch error {
                case .wrongPassword:
                    errorMessage = "Wrong password. Please try again."
                    presentAlert = true
                case .invalidEmail:
                    errorMessage = "Invalid email address."
                    presentAlert = true
                case .somethingWentWrong, .apiError:
                    errorMessage = "Something went wrong. Please try again."
                    presentAlert = true
                }
                presentAlert = true
            }
        } catch {
            isLoading = false
            errorMessage = "Something went wrong."
            presentAlert = true
        }
    }
}
