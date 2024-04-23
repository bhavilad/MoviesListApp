//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 01/02/2024.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.movieListVM.searchBy(movieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            .navigationBarTitle("Movies")
            
            if self.movieListVM.loadingState == .success {
                MoviesListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                ErrorView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
