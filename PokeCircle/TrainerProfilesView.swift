// TrainerProfilesView.swift
// Trainer profile list skeleton

import SwiftUI

struct TrainerProfilesView: View {
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
                        Text("Example Trainers")
                            .font(.cartoonTitle)
                            .foregroundColor(.pokeText)
                    ) {
                        ForEach(0..<3) { idx in
                            NavigationLink(value: idx) {
                                HStack(spacing: 12) {
                                    Circle()
                                        .fill(LinearGradient(colors: [.pokePrimary, .pokeSecondary], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 44, height: 44)
                                        .overlay(Image(systemName: "person.fill").foregroundColor(.white))
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Trainer #\(idx + 1)")
                                            .font(.cartoonBody)
                                            .foregroundColor(.pokeText)
                                        Text("Age: Teen  •  Interests: TCG, GO")
                                            .font(.cartoonCaption)
                                            .foregroundColor(.pokeSubtext)
                                    }
                                    Spacer()
                                    CartoonBadge(text: "Active")
                                }
                                .padding(8)
                                .cartoonCard(cornerRadius: 16)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Trainer Profiles")
        }
    }
}

#Preview {
    TrainerProfilesView()
}
