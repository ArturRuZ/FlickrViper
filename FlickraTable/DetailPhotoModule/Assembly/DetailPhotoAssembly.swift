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
    
    func build() -> (controller: UIViewController, presenter: DetailPhotoPresenterInput)? {
        let storyboard = UIStoryboard(name: "DetailPhotoViewStoryboard", bundle: nil)
        guard let detailPhotoVC  = storyboard.instantiateViewController(withIdentifier: "kDetailPhotoIdentifier") as? DetailPhotoView else {
            return nil}
        
        let presenter = DetailPhotoPresenter()
        let interactor = DetailPhotoInteractor()
        
        
        detailPhotoVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = detailPhotoVC
        interactor.output = presenter
        
  
        return (controller: detailPhotoVC, presenter: presenter)
    }
}
