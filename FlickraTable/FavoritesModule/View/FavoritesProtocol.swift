//
//  FavoritesProtocol.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


protocol FavoritesViewDelegate: class {
    var presenterInput: FavoritesPresenterInput { get set }
    func showData(favoritesList: [PhotosModel])
}


protocol RoutingFavoritesView: class {
    func presentFavoritesView()
}
