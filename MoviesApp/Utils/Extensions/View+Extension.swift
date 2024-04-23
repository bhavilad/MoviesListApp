//
//  View+Extension.swift
//  MoviesApp
//
//  Created by Pinkal Mistry on 01/02/2024.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
