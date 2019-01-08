//
//  DetailPhotoInteractor.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
class DetailPhotoInteractor{
    private weak var interactorOutput : DetailPhotoInteractorOutput!
 
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

