//
//  FavoritesAssembly.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class FavoritesAssembly {
    
    func build(database: DatabaseServiceInput) -> (controller: UIViewController, presenter: FavoritesPresenterInput)? {
        let storyboard = UIStoryboard(name: "FavoritesStoryboard", bundle: nil)
        
        guard let favoritesVC  = storyboard.instantiateViewController(withIdentifier: "kFavoritesViewIdentifier") as? FavoritesViewController else {
            return nil}
        
        let presenter = FavoritesPresenter()
        let interactor = FavoritesInteractor()
        
        
        favoritesVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = favoritesVC
        interactor.output = presenter
        interactor.databse = database
        
        return (controller: favoritesVC, presenter: presenter)
    }
}
