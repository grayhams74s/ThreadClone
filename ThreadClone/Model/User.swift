//
//  User.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImage: String?
    var bio: String
    
    
    init(id: String, fullname: String, email: String, username: String, profileImage: String? = nil, bio: String) {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.username = username
        self.profileImage = profileImage
        self.bio = bio
    }
    
    static let mockUsers: User =
        User(id: "1", fullname: "Alice Smith", email: "alice@example.com", username: "alice_smith", profileImage: "person-1", bio: "Loves hiking and photography.")
    
}
