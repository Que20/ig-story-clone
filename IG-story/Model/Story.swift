import SwiftUI

struct User: Identifiable {
    var id: UUID
    var name: String
    var avatar: URL
}

struct Story: Identifiable {
    var id: UUID
    var owner: User
    var seen: Bool
    var posts: [Post]
    
    struct Post: Identifiable {
        var id: UUID
        var image: URL
        var stats: Stats?
        
        struct Stats {
            var likes: Int
            var views: Int
        }
    }
}

