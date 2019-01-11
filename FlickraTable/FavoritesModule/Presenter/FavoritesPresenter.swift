//
//  FavoritesPresenter.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


class FavoritesPresenter {
    
    private weak var presenterOutputToCoordinator : FavoritesPresenterOutput!
    private weak var view : FavoritesViewInput!
    private var interactor: FavoritesInteractorInput!
    
    deinit{
        print("deinitFavoritesPresenter")}
    
}

extension FavoritesPresenter : FavoritesPresenterInput {
    
    var output: FavoritesPresenterOutput {
        get {
            return presenterOutputToCoordinator
        }
        set {
            presenterOutputToCoordinator = newValue
        }
    }
    
    var viewInput: FavoritesViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
        
    }
    
    var interactorInput: FavoritesInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}


extension FavoritesPresenter : FavoritesInteractorOutput {
    
}

extension FavoritesPresenter{
    func callback() {
        presenterOutputToCoordinator.callback()
    }
}
