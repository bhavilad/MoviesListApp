//
//  BaseViewModel.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 05/02/2024.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
