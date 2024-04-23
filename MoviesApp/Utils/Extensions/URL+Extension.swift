//
//  URL+Extension.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 01/02/2024.
//

import Foundation

extension URL {
    
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
}
