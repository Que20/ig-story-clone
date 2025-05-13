import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    
    func fetchStories() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stories = []
        }
    }
}
