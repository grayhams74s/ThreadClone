//
//  UserService.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

class UserService {
    @Published var CurrentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { 
            try await fetchCurrentUser()
        }
    }
    
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.CurrentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await  Firestore.firestore().collection("users").getDocuments()
        //basically this is just a one-liner for taking all of the documents that we get back from this collection. Here we're getting back all of the documents back and we're just mapping each document data into a user and storing it in this user's array
        let users = snapshot.documents.compactMap({ try?  $0.data(as: User.self)})
        return users.filter({ $0.id != currentUid })
    }
    
    func updateProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImage" : imageUrl
        ])
        self.CurrentUser?.profileImage = imageUrl
        
    }
    
    func reset() {
        self.CurrentUser = nil
    }
}
