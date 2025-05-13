//
//  Home.swift
//  IG-story
//
//  Created by Kevin on 13/05/2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        Button {
                            print("Add Story")
                        } label: {
                            AsyncImage(url: URL(string: "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .foregroundStyle(.gray)
                            }
                            .padding(2)
                            .background(.blue, in: Circle())
                            .frame(width: 50, height: 50)
                        }
                        
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    Home()
}
