//
//  Movie.swift
//  Popping Films
//
//  Created by rsbj on 12/07/22.
//

import Foundation

// Struct de definição do que vai ser mostrado, para facilitar a obtenção de dados

struct Movie: Codable {
    let title: String
    let poster: String
    let backdrop: String
    let voteAverage: Float // <- Esse eh Float
    let releaseDate: String
    let overview: String
    let genres: [String] // <- Observa esse tipo de declaração aqui
}
