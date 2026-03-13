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
import Firebase
import FirebaseAuth



@Observable
class CreateThreadViewModel {
     var currentUser: User?
     var isEditing = false
     var imageURL = ""
     var caption = ""
     var isCreating = false
     private var cancellables = Set<AnyCancellable>()
     var Doneuploading = false
    
    
    @MainActor
    func uploadThread() async throws {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isCreating = true
        }
        guard let userUid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: userUid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.Doneuploading = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              withAnimation(.spring()) {
                  self.isCreating = false
              }
              self.caption = ""
          }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.Doneuploading = false
          }
    }
    
    
    init() {
     setupSubscribers()
        self.imageURL = currentUser?.profileImage ?? ""
    }
    
    
    
    private func setupSubscribers() {
        UserService.shared.$CurrentUser.sink {[ weak self ] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    
}
