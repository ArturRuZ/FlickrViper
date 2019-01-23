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
    private var photoData: PhotosModel?
    
    deinit{
        print("deinit DetailPhotoInteractor")}
    
}


extension DetailPhotoInteractor : DetailPhotoInteractorInput{
    var output: DetailPhotoInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func getPhotoData() {
        print ("получить данные")
        guard let photoData = self.photoData else {return}
        interactorOutput?.presentPhotoData(photoData: photoData)
    }
}


extension DetailPhotoInteractor {
    func prepareFototoShow(selectedPhoto: PhotosModel) {
        print ("сохранить данные")
        self.photoData = selectedPhoto
      
    }
}
