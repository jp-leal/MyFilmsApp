//
//  MyFilmsAppApp.swift
//  MyFilmsApp
//
//  Created by Joao Leal on 9/3/24.
//

import SwiftUI
import SwiftData

@main
struct MyFilmsAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Film.self)
    }
}
