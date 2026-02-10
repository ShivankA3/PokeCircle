// CommunityMapView.swift
// Map page skeleton with layer toggles

import SwiftUI

struct CommunityMapView: View {
    @State private var showTCG = true
    @State private var showVGC = true
    @State private var showGO = true
    @State private var showCollectors = true
    
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
                    // Layer toggles inside a card
                    VStack(spacing: 10) {
                        HStack {
                            Toggle("TCG", isOn: $showTCG)
                            Toggle("VGC", isOn: $showVGC)
                        }
                        HStack {
                            Toggle("GO", isOn: $showGO)
                            Toggle("Collectors", isOn: $showCollectors)
                        }
                    }
                    .tint(.pokePrimary)
                    .font(.cartoonBody)
                    .cartoonCard(cornerRadius: 16)
                    .padding(.horizontal)

                    // Map placeholder card
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(LinearGradient(colors: [.pokePrimary.opacity(0.25), .pokeSecondary.opacity(0.25)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(color: .pokeShadow.opacity(0.10), radius: 14, x: 0, y: 8)
                        VStack(spacing: 8) {
                            Image(systemName: "map.fill")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.pokePrimary)
                            Text("Map region placeholder")
                                .font(.cartoonTitle)
                                .foregroundColor(.pokeText)
                        }
                    }
                    .frame(height: 320)
                    .padding(.horizontal)

                    Spacer(minLength: 0)
                }
            }
            .navigationTitle("Poké-Community Map")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Label("Filters", systemImage: "slider.horizontal.3")
                    }
                    .buttonStyle(CartoonButtonStyle(fill: .pokeAccent))
                }
            }
        }
    }
}

#Preview {
    CommunityMapView()
}
