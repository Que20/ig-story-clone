//
//  Home.swift
//  IG-story
//
//  Created by Kevin on 13/05/2025.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel: StoryViewModel = .init()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                       selfAvatar()
                        ForEach($viewModel.stories) { $story in
                            StoryUserView(story: $story)
                        }
                        
                    }
                }
                .padding()
            }
        }
        .task {
            viewModel.fetchStories()
        }
    }
    
    func selfAvatar() -> some View {
        // TODO: Add + sign
        Button {
            print("Add Story")
        } label: {
            Image("avatar1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .padding(2)
                .background(.blue, in: Circle())
                .frame(width: 50, height: 50)
        }
    }
}

struct StoryUserView: View {
    @Binding var story: Story
    var body: some View {
        Button {
            print("Show Story")
            story.seen = true
        } label: {
            Image(story.owner.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .padding(2)
                .background {
                    LinearGradient(colors: [.red, .orange, .red, .orange],
                       startPoint: .top,
                       endPoint: .bottom
                    )
                    .clipShape(Circle())
                    .opacity(story.seen ? 0.2 : 1)
                }
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    Home()
}
