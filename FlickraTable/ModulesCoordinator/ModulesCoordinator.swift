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
        presentFlickraViewt()
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
        presentgDetailPhotoViewt()

        for i in 0..<presenterArray.count {
            guard let presenter = presenterArray[i] as? DetailPhotoPresenterInput else {continue}
            presenter.prepareFototoShow(dataCell: dataCell, selectedPhoto: selectedPhoto)
        }   
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



extension ModulesCoordinator : RoutingFlickraView {
    func presentFlickraViewt() {
        let flickraAssembly = FlickraAssembly()
        guard let flickra = flickraAssembly.build(internetService: internetService, database: database) else { return}
        flickra.presenter.output = self
        presenterArray.append(flickra.presenter)
        flickra.controller.title = "Flickr Photos"
        rootNavigationVC.pushViewController(flickra.controller, animated: true)
    }
    
    func dismissFlickraView() {
        rootNavigationVC.dismiss(animated: true, completion: nil)
    }
}

extension ModulesCoordinator : RoutingDetailPhotoView {
    func presentgDetailPhotoViewt() {
        let detailPhotoView = DetailPhotoAssembly()
        guard let detailPhoto = detailPhotoView.build() else { return}
        detailPhoto.presenter.output = self
        presenterArray.append(detailPhoto.presenter)
        rootNavigationVC.pushViewController(detailPhoto.controller, animated: true)
        
    }
    
    func dismissgDetailPhotoView() {
        rootNavigationVC.dismiss(animated: true, completion: nil)
    }
    
}
