// TradingView.swift
// Trading system skeleton

import SwiftUI

struct TradingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.pokeBackgroundTop, .pokeBackgroundBottom],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("Trade Cards")
                        .font(.cartoonLargeTitle)
                        .foregroundColor(.pokeText)
                        .padding(.top)

                    List {
                        Section(header:
                            Text("Nearby Trades")
                                .font(.cartoonTitle)
                                .foregroundColor(.pokeText)
                        ) {
                            ForEach(0..<2) { idx in
                                HStack(alignment: .top, spacing: 12) {
                                    Circle()
                                        .fill(LinearGradient(colors: [.pokePrimary, .pokeSecondary], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 44, height: 44)
                                        .overlay(Image(systemName: "person.fill").foregroundColor(.white))

                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Trainer #\(idx + 1)")
                                            .font(.cartoonBody)
                                            .foregroundColor(.pokeText)
                                        Text("Have: Pikachu, Charizard")
                                            .font(.cartoonCaption)
                                            .foregroundColor(.pokeSubtext)
                                        Text("Want: Mewtwo, Eevee")
                                            .font(.cartoonCaption)
                                            .foregroundColor(.pokeSubtext)
                                    }
                                    Spacer()
                                    CartoonBadge(text: "New")
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

                    Button(action: {}) {
                        Label("Post a Trade", systemImage: "plus.circle.fill")
                    }
                    .buttonStyle(CartoonButtonStyle(fill: .pokePrimary))
                    .padding(.bottom)
                }
            }
            .navigationTitle("Trading")
        }
    }
}

#Preview {
    TradingView()
}
