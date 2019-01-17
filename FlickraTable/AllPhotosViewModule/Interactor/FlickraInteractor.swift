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
    
    var output: FlickraInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func getData() {
        downloadData()
    }
    
}


extension FlickraInteractor : PhotosStorageOutput {
    func presentData(storage: inout [PhotosModel]) {
        let favoritesList = databse.loadObjectsFromBase()
        var favoritesObjectId = [String]()
        for i in 0..<favoritesList.count{
            favoritesObjectId.append(favoritesList[i].id)
        }
        for i in 0..<storage.count{
            guard favoritesObjectId.firstIndex(of: storage[i].id) != nil else {continue}
            storage[i].isFavorite = true
        }
        interactorOutput.presentData(storage: storage)
    }
}


extension FlickraInteractor {
    private func downloadData() {
        let url = URL(string: "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=40&page=1&format=json&nojsoncallback=1&extras=url_l&date=2018-09-23")
        internetService.loadData(fromURL: url, parseInto: PhotosResponse.self, success: { (response: PhotosResponse) in
            self.storageInput.saveData(parsedData: response)
        }) { (code) in
            print("Error")
        }
    }
    
    func updateData(updateData: PhotosModel) {
        storageInput.updateData(updateData:updateData)
        self.databse.uopdateObjectsStateInBase(data: updateData)
    }
}

