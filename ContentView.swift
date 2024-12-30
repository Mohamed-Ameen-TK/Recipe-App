////
////  ContentView.swift
////  MyCity
////
////  Created by Mohamed Ameen on 07/11/24.

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var showSheet: Bool = false
    @Query private var players: [ToPlayers]
    @State private var toEditPlayers: ToPlayers?
    @State private var searchText: String = ""
    @State private var isAscending: Bool = true

    var filteredPlayers: [ToPlayers] {
        guard !searchText.isEmpty else { return players }
        return players.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var sortedFilteredPlayers: [ToPlayers] {
        filteredPlayers.sorted { isAscending ? $0.age < $1.age : $0.age > $1.age }
    }

    var body: some View {
        NavigationStack {
            List(sortedFilteredPlayers) { player in
                HStack(spacing: 16) {
                    if let photoData = player.photo, let uiImage = UIImage(data: photoData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    } else if let image = UIImage(named: player.imageName) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading) {
                        Text(player.name)
                            .font(.headline)
                            .foregroundColor(.primary)

                        Text("Position: \(player.position)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Age: \(player.age)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Country: \(player.country)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            context.delete(player)
                            do {
                                try context.save()
                            } catch {
                                print("Error saving: \(error)")
                            }
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                            .symbolVariant(.fill)
                    }

                    Button {
                        toEditPlayers = player
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.orange)
                }
            }
            .navigationTitle("MyCity Players")
            .searchable(text: $searchText, prompt: "Search for players")
            
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    isAscending.toggle()
                                }) {
                                    Label("Sort by Age", systemImage: isAscending ? "arrow.up" : "arrow.down")
                                }
                            }
                       }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Label("Add Player", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showSheet) {
                CreatePlayers()
            }
            .sheet(item: $toEditPlayers) { player in
                UpdatePlayersView(player: player)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToPlayers.self)
}

