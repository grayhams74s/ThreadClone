//
//  FeedViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/13/26.
//

import Foundation

@Observable
class FeedViewModel {
    
    var threads: [Thread] = []
    
    init() {
        print("[FeedViewModel] init()")
        Task {
            do {
                print("[FeedViewModel] calling fetchThreads()")
                try await fetchThreads()
                print("[FeedViewModel] fetchThreads() finished. threads.count = \(threads.count)")
            } catch {
                print("[FeedViewModel] fetchThreads() error: \(error)")
            }
        }
    }
    
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataforThreads()
    }
    
    
    @MainActor
    private func fetchUserDataforThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerID = thread.ownerUid
            let threadUser = try await UserService.fetchUserUID(withUID: ownerID)
            threads[i].User = threadUser
        }
    }

    
}
