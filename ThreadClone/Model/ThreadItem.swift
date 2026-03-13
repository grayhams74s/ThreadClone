import Foundation
import SwiftUI

struct ThreadItem: Identifiable, Codable {
    var id = UUID()
    var profilepic: String
    var username: String
    var thread: String
    
    
    init(id: UUID = UUID(), profilepic: String, username: String, thread: String) {
        self.id = id
        self.profilepic = profilepic
        self.username = username
        self.thread = thread
    }
}

extension ThreadItem {
    
    static let mockThread: [ThreadItem] = [
        ThreadItem(profilepic: "person-1", username: "Alice Sign", thread: "Hello, world!"),
        ThreadItem(profilepic: "person-2", username: "Bob Schiender", thread: "Second post in the feed."),
        ThreadItem(profilepic: "person-3", username: "Jeffrey Stone", thread: "Another day, another thread."),
        ThreadItem(profilepic: "person-3", username: "carol", thread: "Another day, another thread."),
        ThreadItem(profilepic: "person-3", username: "carol", thread: "Another day, another thread."),
        ThreadItem(profilepic: "person-3", username: "carol", thread: "Another day, another thread."),
        ThreadItem(profilepic: "person-3", username: "carol", thread: "Another day, another thread."),
        ThreadItem(profilepic: "person-3", username: "carol", thread: "Another day, another thread.")
    ]
    
}
