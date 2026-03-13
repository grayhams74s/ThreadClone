//
//  ContentViewModel.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/9/26.
//

import Foundation
import Combine
import FirebaseAuth



@Observable
class ContentViewModel {
    
    var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        setupSubsribers()
    }
    
    
    private func setupSubsribers () {
        AuthService.shared.$userSession.sink { [ weak self ] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
        
    }
    
}
