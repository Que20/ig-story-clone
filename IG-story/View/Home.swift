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
                Image(systemName: "tray")
                    .resizable()
                    .frame(width: 70, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .foregroundStyle(.gray)
                Text("Rien à voir ici...")
                    .foregroundStyle(.gray)
            }
        }
        .overlay {
            StoryPannelView()
        }
        .task {
            viewModel.fetchStories()
        }
        .environmentObject(viewModel)
    }
    
    func selfAvatar() -> some View {
        // TODO: Add + sign
        Button {
            print("Add Story")
        } label: {
            Image("avatar0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .padding(2)
                .background(.blue, in: Circle())
                .frame(width: 60, height: 60)
        }
    }
}

struct StoryUserView: View {
    @Binding var story: Story
    @EnvironmentObject var viewModel: StoryViewModel
    var body: some View {
        Button {
            story.seen = true
            withAnimation {
                viewModel.currentStory = story.id
                viewModel.storyPannelPresented = true
            }
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
                .frame(width: 60, height: 60)
        }
    }
}

#Preview {
    Home()
}
