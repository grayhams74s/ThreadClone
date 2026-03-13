//
//  ThreadService.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/11/26.
//

import Foundation
import Firebase
import FirebaseFirestore

struct ThreadService {
    
    
    static func uploadThread (_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("thread").addDocument(data: threadData)
    }
}
