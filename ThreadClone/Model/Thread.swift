//
//  Thread.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/11/26.
//

import Foundation
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadID ?? NSUUID().uuidString
    }
    
    var User: User?
    
}
