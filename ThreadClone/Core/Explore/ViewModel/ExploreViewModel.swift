//
//  ExploreViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/10/26.
//

import Foundation



@Observable
class ExploreViewModel {
    
    var users = [User]()
    
    init() {
        Task {
            try await fetchusers()
        }
    }
    
    @MainActor
    private func fetchusers() async throws {
        self.users = try await UserService.fetchUsers() 
    }
}

