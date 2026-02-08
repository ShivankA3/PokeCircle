// CommunityFeedView.swift
// Community Feed skeleton

import SwiftUI

struct CommunityFeedView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Community Posts")) {
                    ForEach(0..<3) { idx in
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Sample Post #\(idx + 1)")
                                .font(.headline)
                            Text("Trading at the library 4–6pm today!")
                                .font(.subheadline)
                            HStack {
                                Button("Upvote") {}
                                Button("Comment") {}
                            }
                            .font(.caption)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("Community Feed")
        }
    }
}

#Preview {
    CommunityFeedView()
}
