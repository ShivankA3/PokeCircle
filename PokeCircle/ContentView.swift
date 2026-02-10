//
//  ContentView.swift
//  PokeCircle
//
//  Created by Shivank Ahuja on 1/27/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [.pokeBackgroundTop, .pokeBackgroundBottom],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                List {
                    Section {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.cartoonBody)
                                    .foregroundColor(.pokeText)
                                    .padding()
                                    .navigationTitle("Details")
                            } label: {
                                HStack(spacing: 12) {
                                    ZStack {
                                        Circle()
                                            .fill(LinearGradient(colors: [.pokePrimary, .pokeSecondary], startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: 44, height: 44)
                                        Image(systemName: "sparkles")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(.white)
                                    }

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.timestamp!, formatter: itemFormatter)
                                            .font(.cartoonBody)
                                            .foregroundColor(.pokeText)
                                        HStack(spacing: 8) {
                                            CartoonBadge(text: "New")
                                            Text("Tap to view")
                                                .font(.cartoonCaption)
                                                .foregroundColor(.pokeSubtext)
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.pokeSubtext)
                                }
                                .padding(8)
                                .cartoonCard(cornerRadius: 16)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    } header: {
                        Text("Your Feed")
                            .font(.cartoonTitle)
                            .foregroundColor(.pokeText)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add", systemImage: "plus")
                    }
                    .buttonStyle(CartoonButtonStyle(fill: .pokeAccent))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                    }
                    .buttonStyle(CartoonButtonStyle(fill: .pokePrimary))
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Label("Trade", systemImage: "bag")
                    }
                    .buttonStyle(CartoonButtonStyle(fill: .pokeSecondary))
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

