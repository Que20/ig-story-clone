//
//  StoryPannelView.swift
//  IG-story
//
//  Created by Kevin on 13/05/2025.
//

import SwiftUI

struct StoryPannelView: View {
    @EnvironmentObject private var viewModel: StoryViewModel
    
    var body: some View {
        if viewModel.storyPannelPresented {
            TabView(selection: $viewModel.currentStory) {
                ForEach(viewModel.stories) { story in
                    HStack {
                        Text(story.owner.name)
                            .foregroundStyle(.white)
                        Button("close") {
                            withAnimation {
                                viewModel.storyPannelPresented = false
                            }
                        }
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .transition(.offset(y: screenSize.height + 50))
        }
    }
    
    var screenSize: CGSize {
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.screen {
            return screen.bounds.size
        }
        
        return .zero
    }
}

#Preview {
    StoryPannelView()
}
