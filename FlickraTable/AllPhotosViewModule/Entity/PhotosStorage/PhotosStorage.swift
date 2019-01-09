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
    func saveData(data: PhotosResponse) {
        for i in 0..<data.photos.photo.count {
            let photoStruct = PhotosModel(title: data.photos.photo[i].title, url: data.photos.photo[i].url_l,id: data.photos.photo[i].id, isFavorite: false)
           storage.append(photoStruct)
        }
        interactor.presentData(storage: storage)
    }
}

//extension PhotosStorage: ViewCellModel {
    
    
  //  }
    
    
    

    
    

    

