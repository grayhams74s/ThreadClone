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
    
    static func fetchThreads() async throws -> [Thread] {
        let query = Firestore.firestore().collection("thread").order(by: "timestamp", descending: true)
        let snapshot = try await query.getDocuments()
        let thread = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        return thread
    }
}
