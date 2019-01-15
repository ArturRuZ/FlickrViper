//
//  FavoritesPresenter.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


class FavoritesPresenter {
    
    private weak var presenterOutput : FavoritesPresenterOutput!
    private weak var view : FavoritesViewDelegate!
    private var interactor: FavoritesInteractorInput!
    
    deinit{
        print("deinitFavoritesPresenter")}
    
}

extension FavoritesPresenter : FavoritesPresenterInput {
    
    var output: FavoritesPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: FavoritesViewDelegate {
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
    func dataPrepared(data: [PhotosModel]) {
        view?.showData(favoritesList: data)
    }
    
    
}

extension FavoritesPresenter{
    func backButtonPressed() {
        presenterOutput.comeBackPrepare()
    }
    func viewDidLoad(){
        interactor?.prepareData()
    }
}
