//
//  DetailPhotoInteractor.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoInteractor{
    private weak var interactorOutput : DetailPhotoInteractorOutput!
    private var photo: UIImage?
    private var isFovorite: Bool?
 
}

extension DetailPhotoInteractor : DetailPhotoInteractorInput{
    
    func getData() {
      
    }
    
    var output: DetailPhotoInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}

extension DetailPhotoInteractor {
    func prepareFototoShow(photo: UIImage, isFavorite: Bool) {
        self.photo = photo
        self.isFovorite = isFavorite
    }
}
