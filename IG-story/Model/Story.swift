import SwiftUI

struct User: Identifiable {
    var id: UUID
    var name: String
    var avatar: String
}

struct Story: Identifiable, Equatable {
    var id: UUID
    var owner: User
    var seen: Bool
    var posts: [Post]
    
    static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.id == rhs.id
    }
    
    struct Post: Identifiable {
        var id: UUID
        var image: String
        var stats: Stats?
        
        struct Stats {
            var likes: Int
            var views: Int
        }
    }
}

