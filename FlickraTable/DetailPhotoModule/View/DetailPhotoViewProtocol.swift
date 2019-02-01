//
//  DetailPhotoViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPhotoViewDelegate: class {
    var output: DetailPhotoViewOutput { get set }
    func presentPhoto(photoData: PhotosModel)
}

protocol DetailPhotoViewOutput: class {
   func viewDidLoad()
   func backButtonPressed(loadedData: PhotosModel)
}

protocol RoutingDetailPhotoView: class {
   
}
