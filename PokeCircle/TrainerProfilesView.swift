// TrainerProfilesView.swift
// Trainer profile list skeleton

import SwiftUI

struct TrainerProfilesView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Example Trainers")) {
                    ForEach(0..<3) { idx in
                        NavigationLink(value: idx) {
                            VStack(alignment: .leading) {
                                Text("Trainer #\(idx + 1)")
                                    .font(.headline)
                                Text("Age: Teen  •  Interests: TCG, GO")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Trainer Profiles")
        }
    }
}

#Preview {
    TrainerProfilesView()
}
