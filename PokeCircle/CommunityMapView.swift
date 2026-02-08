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
            VStack {
                HStack {
                    Toggle("TCG", isOn: $showTCG)
                    Toggle("VGC", isOn: $showVGC)
                }
                .padding(.horizontal)
                HStack {
                    Toggle("GO", isOn: $showGO)
                    Toggle("Collectors", isOn: $showCollectors)
                }
                .padding(.horizontal)
                Spacer()
                Text("[Map region placeholder]")
                    .font(.headline)
                Spacer()
            }
            .navigationTitle("Poké-Community Map")
        }
    }
}

#Preview {
    CommunityMapView()
}
