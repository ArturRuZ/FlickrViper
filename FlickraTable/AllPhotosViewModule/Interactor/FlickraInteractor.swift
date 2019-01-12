//
//  FlickraInteractor.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

class FlickraInteractor {
    private weak var interactorOutput : FlickraInteractorOutput!
    private var storageInput : PhotosStorageInput!
    var internetService: InternetServiceInput!
    var databse : DatabaseServiceInput!
    private var isFirstRun = false
}

extension FlickraInteractor : FlickraInteractorInput {
    var inputStorage: PhotosStorageInput {
        get {
            return storageInput
        }
        set {
            storageInput = newValue
        }
    }
    
    func getData() {
        //isFirstRun ? storageInput.presentData() : downloadData()
        downloadData()
   //let entites = databse.loadEntites()
       
    }
    
    var output: FlickraInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}
extension FlickraInteractor : PhotosStorageOutput {
    func presentData(storage: [PhotosModel]) {
       interactorOutput.presentData(storage: storage)
    }
}

extension FlickraInteractor {
    private func downloadData() {
        let url = URL(string: "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=40&page=1&format=json&nojsoncallback=1&extras=url_l&date=2018-09-23")
        internetService.loadData(fromURL: url, parseInto: PhotosResponse.self, success: { (response: PhotosResponse) in
            //self.storageInput.saveData(data: response)
            var postEntity:[PostEntity]=[]
            for i in 0..<response.photos.photo.count {
                
                let entity = PostEntity()
                 entity.id = response.photos.photo[i].id
                 entity.title = response.photos.photo[i].title
                 entity.url = response.photos.photo[i].url_l
                 entity.isFavorite = "0"
                
                 postEntity.append(entity)}
             self.databse.saveEntites(data: postEntity)
            self.isFirstRun = true
        }) { (code) in
            print("Error")
        }
    }
    
    func updateData(updateData: ViewCellModel) {
        storageInput.updateData(updateData:updateData)
        
    }
}

