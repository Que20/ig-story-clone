import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var storyPannelPresented: Bool = false
    @Published var currentStory: UUID = UUID()
    
    func fetchStories() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stories = [
                .init(id: .init(), owner: .init(id: .init(), name: "Ben", avatar: "avatar1"), seen: false, posts: [.init(id: .init(), image: "story1")]),
                .init(id: .init(), owner: .init(id: .init(), name: "Eva", avatar: "avatar2"), seen: false, posts: [.init(id: .init(), image: "story2"), .init(id: .init(), image: "story3")]),
                .init(id: .init(), owner: .init(id: .init(), name: "Linus", avatar: "avatar3"), seen: false, posts: [.init(id: .init(), image: "story4"), .init(id: .init(), image: "story5")]),
                
            ]
        }
    }
}
