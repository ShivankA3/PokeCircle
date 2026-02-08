// EventsMeetupsView.swift
// Events & Meetups skeleton

import SwiftUI

struct EventsMeetupsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Upcoming Events")) {
                    ForEach(0..<2) { idx in
                        VStack(alignment: .leading) {
                            Text("Event #\(idx + 1)")
                                .font(.headline)
                            Text("Pokémon League Night\nDate: Feb 20, 2026\nLocation: Local Shop")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Events & Meetups")
            .toolbar {
                Button("Create Event") {}
            }
        }
    }
}

#Preview {
    EventsMeetupsView()
}
