//
//  StoryPannelView.swift
//  IG-story
//
//  Created by Kevin on 13/05/2025.
//

import SwiftUI

struct StoryPannelView: View {
    @EnvironmentObject private var viewModel: StoryViewModel
    @State private var currentIndex = 0
    var body: some View {
        if viewModel.storyPannelPresented {
            TabView(selection: $viewModel.currentStory) {
                ForEach(viewModel.stories) { story in
                    storyView(story)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .transition(.offset(y: {
                return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.screen.bounds.size.height ?? .zero
            }()))
        }
    }
    
    func storyView(_ story: Story) -> some View {
        GeometryReader { proxy in
            if story.posts.indices.contains(currentIndex) {
                Image(story.posts[currentIndex].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
            } else {
                Rectangle()
            }
        }
        .overlay {
            VStack(alignment: .leading) {
                HStack {
                    Text(story.owner.name)
                        .foregroundStyle(.white)
                    Spacer()
                    Button {
                        withAnimation {
                            viewModel.storyPannelPresented = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                    }
                }
                HStack {
                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if currentIndex == 0 {
                                withAnimation {
                                    viewModel.previousStoryOrClose()
                                    currentIndex = 0
                                }
                            } else {
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if currentIndex >= story.posts.count - 1 {
                                withAnimation {
                                    viewModel.nextStoryOrClose()
                                    currentIndex = 0
                                }
                            } else {
                                currentIndex += 1
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    StoryPannelView()
        .environmentObject(StoryViewModel())
}
