//
//  ContentView.swift
//  MyFilmsApp
//
//  Created by Joao Leal on 9/3/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var showAddView = false
    @Query(sort: \Film.title) private var films: [Film]
    var body: some View {
        NavigationStack {
            Group{
                
                if films.isEmpty{
                    ContentUnavailableView("Add your first film to start", systemImage: "plus")
                } else {
                    List{
                        ForEach(films) { index in
                            NavigationLink{
                                Text(index.title)
                            } label: {
                                Text(index.title)
                            }
                            Text("Hello, world!")
                        }
                    }}}
                        .toolbar{
                            ToolbarItem{
                                Button {
                                    showAddView = true
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        
                }
            }.sheet(isPresented: $showAddView) {
                AddView()
            }
            .presentationDetents([.medium])
        
    }
}

#Preview {
    HomeView()
}
