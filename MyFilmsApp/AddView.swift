//
//  AddView.swift
//  MyFilmsApp
//
//  Created by Joao Leal on 9/3/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var year = ""
    @State private var country = ""
    @State private var director = ""
    @State private var isRentedOut = false
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Film Details")) {
                    TextField("Title", text: $title)
                    TextField("Year", text: $year)
                        .keyboardType(.numberPad)
                    TextField("Country", text: $country)
                    TextField("Director", text: $director)
                }
                Section{
                    HStack{
                        Spacer()
                Button("Save") {
                    let newFilm = Film(title: title, year: year, country: country, director: director)
                    context.insert(newFilm)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                        Spacer()
            }
                }.listRowBackground(Image(systemName: "sun.max.fill"))
               
            }
            .navigationTitle("Add Film")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: 400)
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    
    }
}

#Preview {
    AddView()
}
