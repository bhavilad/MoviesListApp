//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 05/02/2024.
//

import Foundation

class MovieDetailsViewModel: BaseViewModel {
    
    private var movieDetail: MovieDetails?
    let httpClient = HTTPClient()
    
    init(movieDetail: MovieDetails? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getMovieDetailBy(imdbId: String) {
        httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            switch result {
            case .success(let details):
                self.loadingState = .success
                DispatchQueue.main.async {
                    self.movieDetail = details
                }
            case .failure(let error):
                self.loadingState = .failed
                print("\(error.localizedDescription)")
            }
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
}
