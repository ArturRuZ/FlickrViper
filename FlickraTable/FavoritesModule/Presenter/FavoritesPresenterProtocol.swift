//
//  FavoritesPresenterProtocol.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


protocol FavoritesPresenterInput: class {
    var output:  FavoritesPresenterDelegate { get set }
    var viewInput:  FavoritesViewDelegate { get set }
    var interactorInput:  FavoritesInteractorInput { get set }
    func backButtonPressed()
    func viewDidLoad()
}


protocol  FavoritesPresenterDelegate: class {
    func comeBackPrepare()
}
