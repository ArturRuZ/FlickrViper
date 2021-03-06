//
//  ControllerBuilder.swift
//  FlickraTable
//
//  Created by Артур on 21/01/2019. b
//  Copyright © 2019 Артур. All rights reserved.

//MARK: - Facade implementation

import Foundation
import UIKit



class ControllerPackageBuilder: ControllerPackageBuilderProtocol {
    
    private let internetService: InternetServiceInput = InternetService()
    private let database: DatabaseServiceInput = DatabaseService()
    private let modulesCoordinator : ModulesCoordinator
    
    init(modulesCoordinator: ModulesCoordinator){
        self.modulesCoordinator = modulesCoordinator
    }
    
   
    
    func createPackage<T>(parametrs:BuildingParametrs<T>)->(ControllerPackageProtocol?){
       switch parametrs{
       case .wihoutParametrs(let type):
        return buildPackage(type: type)
       case .withParametrs(let type, let selectedPhoto):
        let detailPhotoVC = buildPackage(type: type)
        guard let detailPhotoPresenter = detailPhotoVC?.presenter as! DetailPhotoPresenterInput? else {return detailPhotoVC}
        guard let photo = selectedPhoto as PhotosModel? else {return detailPhotoVC}
        detailPhotoPresenter.prepareFotoToShow(selectedPhoto: photo)
        return detailPhotoVC
       default:
        return nil
        }
    }
    
    
    func buildPackage<T>(type: T.Type )->(ControllerPackageProtocol?){
        
        switch type {
        case is FlickraViewController.Type:
            return createFlickraController()
            
        case is DetailPhotoViewController.Type:
            return createDetailPhotoController()
            
        case is FavoritesViewController.Type:
            return createFavoritesController()
            
        default:
            return nil
        }
    }
}

extension ControllerPackageBuilder {
    private func createFlickraController()->(ControllerPackageProtocol?){
        let flickraAssembly = FlickraAssembly()
        guard let flickra = flickraAssembly.build(internetService: internetService, database: database) else {return nil}
        flickra.presenter.output = modulesCoordinator
        return  ControllerPackage(controller: flickra.controller, presenter: flickra.presenter)
    }
    
    private func createDetailPhotoController()-> (ControllerPackageProtocol?){
        let detailPhotoView = DetailPhotoAssembly()
        guard let detailPhoto = detailPhotoView.build() else {return nil}
        detailPhoto.presenter.output = modulesCoordinator
        return ControllerPackage(controller: detailPhoto.controller, presenter: detailPhoto.presenter)
    }
    
    private func createFavoritesController()-> (ControllerPackageProtocol?){
        let favoritesView = FavoritesAssembly()
        guard let favorites = favoritesView.build(database: database)else {return nil}
        favorites.presenter.output = modulesCoordinator
        return ControllerPackage(controller: favorites.controller, presenter:favorites.presenter)
    }
}
