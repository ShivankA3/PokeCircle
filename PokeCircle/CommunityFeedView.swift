// CommunityFeedView.swift
// Community Feed skeleton

import SwiftUI

struct CommunityFeedView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.pokeBackgroundTop, .pokeBackgroundBottom],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                List {
                    Section(header:
                        Text("Community Posts")
                            .font(.cartoonTitle)
                            .foregroundColor(.pokeText)
                    ) {
                        ForEach(0..<3) { idx in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 8) {
                                    Text("Sample Post #\(idx + 1)")
                                        .font(.cartoonBody)
                                        .foregroundColor(.pokeText)
                                    CartoonBadge(text: "Hot")
                                }
                                Text("Trading at the library 4–6pm today!")
                                    .font(.cartoonCaption)
                                    .foregroundColor(.pokeSubtext)

                                HStack(spacing: 10) {
                                    Button(action: {}) { Label("Upvote", systemImage: "hand.thumbsup.fill") }
                                        .buttonStyle(CartoonButtonStyle(fill: .pokeAccent))
                                    Button(action: {}) { Label("Comment", systemImage: "text.bubble.fill") }
                                        .buttonStyle(CartoonButtonStyle(fill: .pokeSecondary))
                                }
                            }
                            .padding(8)
                            .cartoonCard(cornerRadius: 16)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Community Feed")
        }
    }
}

#Preview {
    CommunityFeedView()
}
