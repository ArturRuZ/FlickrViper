//
//  DetailPhotoInteractorProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit


protocol  DetailPhotoInteractorInput: class {
    var output: DetailPhotoInteractorOutput { get set }
    func getPhotoData()
    func prepareFototoShow(selectedPhoto: PhotosModel)
}


protocol DetailPhotoInteractorOutput: class {
    func presentPhotoData(photoData: PhotosModel)
}
