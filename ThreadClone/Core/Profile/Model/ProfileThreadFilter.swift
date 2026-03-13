//
//  ProfileThreadFilter.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    
    case threads
    case replies
    case likes
    
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        case .likes:   return "Likes"
        }
    }
    
    var id: Int {return self.rawValue}
    
}
