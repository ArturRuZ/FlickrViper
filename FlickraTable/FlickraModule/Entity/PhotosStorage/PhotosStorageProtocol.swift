//
//  PhotosStorageProtocol.swift
//  FlickraTable
//
//  Created by Артур on 29/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

protocol PhotosStorageInput {
    var storageOutput : PhotosStorageOutput {get set}
    func saveData(data: PhotosResponse)
    
}

protocol PhotosStorageOutput {
    func presentData(storage : [PhotosModel])
}
