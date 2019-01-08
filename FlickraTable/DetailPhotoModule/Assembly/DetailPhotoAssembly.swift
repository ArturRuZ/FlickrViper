//
//  DetailPhotoAssembly.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoAssembly {
    
    func build(internetService: InternetServiceInput) -> (controller: UIViewController, presenter: FlickraPresenterInput)? {
        let storyboard = UIStoryboard(name: "DetailPhotoStoryboard", bundle: nil)
        guard let detailPhotoVC  = storyboard.instantiateViewController(withIdentifier: "kDetailPhotoIdentifier") as? FlickraViewController else {
            return nil}
        
        let presenter = FlickraPresenter()
        let interactor = FlickraInteractor()
        let photoStorage = PhotosStorage()
        
        detailPhotoVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = detailPhotoVC
        interactor.output = presenter
        interactor.inputStorage = photoStorage
        photoStorage.storageOutput = interactor
        interactor.internetService = internetService
        
        
        return (controller: detailPhotoVC, presenter: presenter)
    }
    
    
    
}
