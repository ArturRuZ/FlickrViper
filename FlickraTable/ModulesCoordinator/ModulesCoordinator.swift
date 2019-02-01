//
//  ModulesCoordinator.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import UIKit

class ModulesCoordinator {
    
    private let rootNavigationVC = UINavigationController()
    lazy private var controllerPackageBuilder: ControllerPackageBuilderProtocol = ControllerPackageBuilder(modulesCoordinator: self)
    private var presenterArray : [Any] = []
    
    func rootModuleController() -> UIViewController {
        presentFlickraView()
        return rootNavigationVC
    }
    
    private func removeFromPresenterArray<T>(_ : T.Type){
        for i in 0..<presenterArray.count {
            guard presenterArray[i] is (T) else {continue}
            presenterArray.remove(at: i)
        }
    }
    
    private func findPresenter<T>(_: T.Type) -> (T?){
        var presenter:(T)?
        for i in 0..<presenterArray.count {
            guard let find = presenterArray[i] as? (T) else { continue}
            presenter = find
        }
        return presenter
    }
    
    private func presentController<T>(type: T.Type, selectedPhoto:PhotosModel? = nil){
        var controllerPackage:ControllerPackageProtocol?
        if type is DetailPhotoViewController.Type {
           controllerPackage = controllerPackageBuilder.createPackage(parametrs: BuildingParametrs.withParametrs(type: type, selectedPhoto: selectedPhoto!))
        } else
        {
        controllerPackage = controllerPackageBuilder.createPackage(parametrs: BuildingParametrs.wihoutParametrs(type: type))
        }
        guard controllerPackage != nil else {return}
        presenterArray.append(controllerPackage!.presenter)
        rootNavigationVC.pushViewController(controllerPackage!.controller, animated: true)
    }
}

//MARK: - Impementation delegate protocols

extension ModulesCoordinator : FlickraPresenterDelegate {
    func photoSelected(selectedPhoto: PhotosModel) {
       presentController(type: DetailPhotoViewController.self, selectedPhoto: selectedPhoto )
    }
    func showFavorites(){
        presentFavoritesView()
    }
}

extension ModulesCoordinator : DetailPhotoPresenterDelegate {
    func sentLoadedData(loadedData: PhotosModel) {
        removeFromPresenterArray(DetailPhotoPresenterInput.self)
        guard let presenter = findPresenter(FlickraPresenterInput.self) else {return}
        presenter.updateData(updateData: loadedData)
    }
}

extension ModulesCoordinator : FavoritesPresenterDelegate {
    func comeBackPrepare(){
        removeFromPresenterArray(FavoritesPresenterInput.self)
    }
}

//MARK: - Impementation routing protocols

extension ModulesCoordinator : RoutingFlickraView {
    func presentFlickraView() {
        presentController(type: FlickraViewController.self)
    }
}

extension ModulesCoordinator : RoutingDetailPhotoView {
    func presentDetailPhotoView() {
    }
}

extension ModulesCoordinator : RoutingFavoritesView {
    func presentFavoritesView() {
        presentController(type: FavoritesViewController.self)
    }
}
