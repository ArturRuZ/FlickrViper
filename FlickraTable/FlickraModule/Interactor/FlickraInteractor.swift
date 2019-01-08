//
//  FlickraInteractor.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

class FlickraInteractor {
    private var interactorOutput : FlickraInteractorOutput!
    private var storageInput : PhotosStorageInput!
    var internetService: InternetServiceInput!
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
        downloadData()
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
        self.storageInput.saveData(data: response)
    }) { (code) in
        print("Error")
    }
    
    
}
}

