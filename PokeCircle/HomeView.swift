// HomeView.swift
// Entry point with TabView for all pages

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.pokeBackgroundTop, .pokeBackgroundBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            TabView {
                CommunityMapView()
                    .tabItem { Label("Map", systemImage: "map") }
                TrainerProfilesView()
                    .tabItem { Label("Trainers", systemImage: "person.3") }
                TradingView()
                    .tabItem { Label("Trading", systemImage: "arrow.2.squarepath") }
                CommunityFeedView()
                    .tabItem { Label("Feed", systemImage: "bubble.left.and.bubble.right") }
                EventsMeetupsView()
                    .tabItem { Label("Events", systemImage: "calendar") }
            }
            .tint(.pokePrimary)
        }
    }
}

#Preview {
    HomeView()
}
