//
//  DetailPhotoPresenterProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPhotoPresenterInput: class {
    var output:  DetailPhotoPresenterOutput { get set }
    var viewInput:  DetailPhotoViewDelegate { get set }
    var interactorInput:  DetailPhotoInteractorInput { get set }
    func prepareFotoToShow(selectedPhoto: PhotosModel) 
}

protocol  DetailPhotoPresenterOutput: class {
    func sentLoadedData(loadedData: PhotosModel)
}


