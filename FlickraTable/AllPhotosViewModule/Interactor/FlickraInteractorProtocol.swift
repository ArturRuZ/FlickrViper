//
//  FlickraInteractorProtocol.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation


protocol  FlickraInteractorInput: class {
    var output: FlickraInteractorOutput { get set }
    var inputStorage : PhotosStorageInput { get set }
    func getData()
    func updateData(updateData: PhotosModel)
}

protocol FlickraInteractorOutput: class {
    func presentData( storage : [PhotosModel])
}
