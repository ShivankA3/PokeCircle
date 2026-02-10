// EventsMeetupsView.swift
// Events & Meetups skeleton

import SwiftUI

struct EventsMeetupsView: View {
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
                        Text("Upcoming Events")
                            .font(.cartoonTitle)
                            .foregroundColor(.pokeText)
                    ) {
                        ForEach(0..<2) { idx in
                            HStack(alignment: .top, spacing: 12) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [.pokeAccent, .pokeSecondary], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 44, height: 44)
                                    .overlay(Image(systemName: "calendar").foregroundColor(.white))

                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Event #\(idx + 1)")
                                        .font(.cartoonBody)
                                        .foregroundColor(.pokeText)
                                    Text("Pokémon League Night\nDate: Feb 20, 2026\nLocation: Local Shop")
                                        .font(.cartoonCaption)
                                        .foregroundColor(.pokeSubtext)
                                }
                                Spacer()
                                CartoonBadge(text: "Soon")
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
            .navigationTitle("Events & Meetups")
            .toolbar {
                Button(action: {}) {
                    Label("Create Event", systemImage: "plus")
                }
                .buttonStyle(CartoonButtonStyle(fill: .pokeSecondary))
            }
        }
    }
}

#Preview {
    EventsMeetupsView()
}
