//
//  EditProfileViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/10/26.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine



@Observable
class EditProfileViewModel {
    
    var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    var selectedImage: PhotosPickerItem? {
        didSet { Task {
            await loadImage ()
            
        }}
   }
    //For frontend displaying image
    var profileImage: Image?
    //For backend uploading
    var uiImage: UIImage?
    var currentUseremail = ""
    var currentUserbio = ""
    var currentUserImageURL = ""

    
    
    func updateUserData() async throws{
        try await updateProfileImage()
    }
    
    init() {
     setupSubscribers()
        self.currentUseremail = currentUser?.email ?? ""
        self.currentUserbio = currentUser?.bio ?? ""
        self.currentUserImageURL = currentUser?.profileImage ?? ""
        print("Profile pic URL: \(currentUserImageURL)")

    }
    

    @MainActor
    private func loadImage() async {
        guard let item = selectedImage else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        self.uiImage =  UIImage(data: data)
    }
    
    private func setupSubscribers() {
        UserService.shared.$CurrentUser.sink {[ weak self ] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        let imageUrl = try? await imageUploader.uploadImage(image)
        guard let imageUrl else { return }
        try await UserService.shared.updateProfileImage(withImageUrl: imageUrl)
    }
}
