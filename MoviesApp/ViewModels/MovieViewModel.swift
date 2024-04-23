//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 01/02/2024.
//

import Foundation
import SwiftUI

class MovieListViewModel: BaseViewModel {
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchBy(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            
            switch result {
                
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.loadingState = .success
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                self.loadingState = .failed
                print(error.localizedDescription)
            }
        }
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
