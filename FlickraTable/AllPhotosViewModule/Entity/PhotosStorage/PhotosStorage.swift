//
//  PhotosStorage.swift
//  FlickraTable
//
//  Created by Артур on 29/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

class  PhotosStorage {
   private weak var interactor: PhotosStorageOutput!
   // var storage : [Int: [String : String]] = [:]
    var storage = [PhotosModel]()
}

extension PhotosStorage : PhotosStorageInput {
    var storageOutput: PhotosStorageOutput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}
extension PhotosStorage {
    func saveData(parsedData: PhotosResponse) {
        for i in 0..<parsedData.photos.photo.count {
            let photoStruct = PhotosModel(id: parsedData.photos.photo[i].id, title: parsedData.photos.photo[i].title, url: parsedData.photos.photo[i].url_l, isFavorite: false)
           storage.append(photoStruct)
        }
        interactor.presentData(storage: &storage)
    }
}

extension PhotosStorage{
    func updateData(updateData: ViewCellModel) {
        for i in 0..<storage.count {
            if  storage[i].id == updateData.id  {
                storage[i].isFavorite = updateData.isFavorite}
        }
    }
    func presentData() {
        interactor.presentData(storage: &storage)

    }
}
    
    
    

    
    

    

