//
//  RegistrationViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation


@Observable
class RegistrationViewModel {
     var email = ""
     var password: String = ""
     var fullname = ""
     var username = ""
     var isLoading = false
    
    @MainActor
    func createUser() async throws {
        isLoading = true
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
