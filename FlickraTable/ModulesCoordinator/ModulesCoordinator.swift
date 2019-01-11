//
//  ModulesCoordinator.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import UIKit


class ModulesCoordinator {
    
    private var rootNavigationVC : UINavigationController
    private let internetService: InternetServiceInput
    private let database: DatabaseServiceInput
    private var presenterArray : [Any] = []
    
    func rootModuleController() -> UIViewController {
        presentFlickraView()
        return rootNavigationVC
        
    }
    
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput, rootNavigationVC: UINavigationController) {
        self.internetService = internetService
        self.rootNavigationVC = rootNavigationVC
        self.database = database
    }
}


extension ModulesCoordinator : FlickraPresenterOutput {
    func photoSelected(dataCell: ViewCellModel, selectedPhoto: UIImage) {
        presentDetailPhotoView()

        for i in 0..<presenterArray.count {
            guard let presenter = presenterArray[i] as? DetailPhotoPresenterInput else {continue}
            presenter.prepareFototoShow(dataCell: dataCell, selectedPhoto: selectedPhoto)
        }   
    }
    func showFavorites(){
        presentFavoritesView()
        for i in 0..<presenterArray.count {
            guard let presenter = presenterArray[i] as? FavoritesPresenterInput else {continue}
        }
    }
}

extension ModulesCoordinator : RoutingFlickraView {
    func presentFlickraView() {
        let flickraAssembly = FlickraAssembly()
        guard let flickra = flickraAssembly.build(internetService: internetService, database: database) else { return}
        flickra.presenter.output = self
        presenterArray.append(flickra.presenter)
        rootNavigationVC.pushViewController(flickra.controller, animated: true)
    }
    
    func dismissFlickraView() {
    }
}

extension ModulesCoordinator : DetailPhotoPresenterOutput {
    func saveChanges(savedData: ViewCellModel) {
        for i in 0..<presenterArray.count {
            guard presenterArray[i] is DetailPhotoPresenterInput else {continue}
            presenterArray.remove(at: i)
            print (presenterArray.count)
            for i in 0..<presenterArray.count {
                guard let presenter = presenterArray[i] as? FlickraPresenterInput else {continue}
                presenter.updateData(updateData: savedData)
            }
        }
    }
}

extension ModulesCoordinator : RoutingDetailPhotoView {
    func presentDetailPhotoView() {
        let detailPhotoView = DetailPhotoAssembly()
        guard let detailPhoto = detailPhotoView.build() else { return}
        detailPhoto.presenter.output = self
        presenterArray.append(detailPhoto.presenter)
        rootNavigationVC.pushViewController(detailPhoto.controller, animated: true)
    }
    
    func dismissDetailPhotoView() {
    }
}


extension ModulesCoordinator : FavoritesPresenterOutput {
    
    func callback(){
        for i in 0..<presenterArray.count {
            guard presenterArray[i] is FavoritesPresenterInput else {continue}
            presenterArray.remove(at: i)
        }
    }
}

extension ModulesCoordinator : RoutingFavoritesView {
    func presentFavoritesView() {
        let favoritesView = FavoritesAssembly()
        guard let favorites = favoritesView.build() else { return}
        favorites.presenter.output = self
        presenterArray.append(favorites.presenter)
        rootNavigationVC.pushViewController(favorites.controller, animated: true)
    }
    
    func dismissFavoritesView() {
    }
}
