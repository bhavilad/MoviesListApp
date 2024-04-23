//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 05/02/2024.
//

import Foundation

struct MovieDetails: Codable {
    
    let imdbId: String
    let poster: String
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbId = "imdbID"
        case poster = "Poster"
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
    }
}


