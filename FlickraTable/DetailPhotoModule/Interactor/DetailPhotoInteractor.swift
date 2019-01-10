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
    private var data: ViewCellModel?
    
    deinit{
        print("deinit DetailPhotoInteractor")}
    
}

extension DetailPhotoInteractor : DetailPhotoInteractorInput{
    
    func getData() {
        
        guard let photo = self.photo else {return}
        guard let data = self.data else {return}
        interactorOutput?.presentData(data: data, photo: photo)
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
    func prepareFototoShow(dataCell: ViewCellModel, selectedPhoto: UIImage) {
        self.photo = selectedPhoto
        self.data = dataCell
    }
}
