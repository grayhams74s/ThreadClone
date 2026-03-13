//
//  ProfileViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation
import SwiftUI
import Combine
import PhotosUI


@Observable
class ProfileeViewModel {
     var currentUser: User?
     var isEditing = false
     private var cancellables = Set<AnyCancellable>()    
    
    init() {
     setupSubscribers()
    }
    
    
    private func setupSubscribers() {
        UserService.shared.$CurrentUser.sink {[ weak self ] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    
}
