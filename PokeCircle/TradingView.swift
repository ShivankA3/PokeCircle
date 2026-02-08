// TradingView.swift
// Trading system skeleton

import SwiftUI

struct TradingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Trade Cards")
                    .font(.largeTitle)
                List {
                    Section(header: Text("Nearby Trades")) {
                        ForEach(0..<2) { idx in
                            VStack(alignment: .leading) {
                                Text("Trainer #\(idx + 1)")
                                    .bold()
                                Text("Have: Pikachu, Charizard")
                                Text("Want: Mewtwo, Eevee")
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                Button("Post a Trade") {}
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top)
            .navigationTitle("Trading")
        }
    }
}

#Preview {
    TradingView()
}
