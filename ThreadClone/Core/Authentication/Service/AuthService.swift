//
//  AuthService.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Combine



class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init () {
        self.userSession = Auth.auth().currentUser
    }
    
    var placeholder = "https://firebasestorage.googleapis.com/v0/b/threadclone-c7aaa.firebasestorage.app/o/profile_images%2Fplaceholder.png?alt=media&token=f6cca72e-4861-4e5d-a550-c8300acfd1ad"
    
    
    @MainActor
    func loginUser(withEmail email: String, password: String) async throws -> Result<LoginSuccessResponse, LoginErrorResponse> {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("User Logged In!")
            return .success(.sucessFullyLoggedIn)
        }  catch {
                let nsError = error as NSError
            if let errorCode = AuthErrorCode(rawValue: nsError.code) {
                switch errorCode {
                case .wrongPassword:
                    return .failure(.wrongPassword)
        
                case .invalidEmail:
                    return .failure(.invalidEmail)
    
                default:
                    return .failure(.somethingWentWrong)
                }
            }

        }
        return .success(.sucessFullyLoggedIn)
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let userId = result.user.uid
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: userId)
        } catch {
            
        }
    }
    
    
    func signOut() {
        try? Auth.auth().signOut() //signs out on back end
        self.userSession = nil // This removes session locally and updates routing.
        UserService.shared.reset()
        
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
        
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username, profileImage: placeholder, bio: "")
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.CurrentUser = user
    }
}

