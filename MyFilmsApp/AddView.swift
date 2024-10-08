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
                        Button {
                            let newFilm = Film(title: title, year: year, country: country, director: director)
                            context.insert(newFilm)
                            dismiss()
                        }
                        label: {
                            HStack{
                                Spacer()
                                Text("Save")
                                Spacer()
                            }
                        }
                        .disabled(title.isEmpty || year.isEmpty || country.isEmpty || director.isEmpty)         .buttonStyle(.borderless)
                        .listRowBackground(Color.secondary)
                    }
                }
               
            }
            .navigationTitle("Add Film")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: 400)
            
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                        .controlSize(.small)
                }
            }
        }
    
    }
}

#Preview {
    AddView()
}
