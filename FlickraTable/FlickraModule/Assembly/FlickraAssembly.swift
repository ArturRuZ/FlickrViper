//
//  FlickraAssembly.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit

class FlickraAssembly {
    
    func build(internetService: InternetServiceInput) -> (controller: UIViewController, presenter: FlickraPresenterInput)? {
        let storyboard = UIStoryboard(name: "FlickraStoryboard", bundle: nil)
        guard let flickraVC  = storyboard.instantiateViewController(withIdentifier: "kFlickraNavigationControllerIdentifier") as? FlickraViewController else {
            return nil}
       
        let presenter = FlickraPresenter()
        let interactor = FlickraInteractor()
        let photoStorage = PhotosStorage()
        
        flickraVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = flickraVC
        interactor.output = presenter
        interactor.inputStorage = photoStorage
        photoStorage.storageOutput = interactor
        interactor.internetService = internetService
        
        
        return (controller: flickraVC, presenter: presenter)
    }
    
    
    
}
