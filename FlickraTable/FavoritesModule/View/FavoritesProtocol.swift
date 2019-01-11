//
//  FavoritesProtocol.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


protocol FavoritesViewInput: class {
    var presenterInput: FavoritesPresenterInput { get set }
    
    
}

protocol RoutingFavoritesView: class {
    func presentFavoritesView()
    func dismissFavoritesView()
}
