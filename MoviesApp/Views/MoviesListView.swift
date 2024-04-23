//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 01/02/2024.
//

import SwiftUI

struct MoviesListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        
        List(self.movies, id: \.imdbId) { movie in
            MovieCell(movie: movie)
        }
    }
}

struct MovieCell: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top){
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
