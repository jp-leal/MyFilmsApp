//
//  Film.swift
//  MyFilmsApp
//
//  Created by Joao Leal on 9/3/24.
//

import Foundation
import SwiftData

@Model
class Film{
    var title: String
    var year: Int
    var country: String
    var director: String
    var isRentedOut: Bool
    
    init(
        title: String,
        year: Int,
        country: String,
        director: String,
        isRentedOut: Bool = false
    ) {
        self.title = title
        self.year = year
        self.country = country
        self.director = director
        self.isRentedOut = isRentedOut
    }
}
