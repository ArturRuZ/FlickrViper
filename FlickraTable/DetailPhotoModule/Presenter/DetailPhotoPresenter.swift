//
//  DetailPhotoPresenter.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoPresenter {
    
    private weak var presenterOutput : DetailPhotoPresenterDelegate!
    private weak var view : DetailPhotoViewDelegate!
    private var interactor: DetailPhotoInteractorInput!
    
    deinit{
        print("deinit DetailPhotoPresenter")}
    
    
    }



extension DetailPhotoPresenter : DetailPhotoPresenterInput {
    
    
    var output: DetailPhotoPresenterDelegate {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: DetailPhotoViewDelegate {
        get {
            return view
        }
        set {
            view = newValue
        }
        
    }
    
    var interactorInput: DetailPhotoInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}


extension DetailPhotoPresenter : DetailPhotoInteractorOutput {
    func presentPhotoData(photoData: PhotosModel) {
        view.presentPhoto(photoData: photoData)
    }
}


extension DetailPhotoPresenter{
    func prepareFotoToShow(selectedPhoto: PhotosModel) {
        interactor.prepareFototoShow(selectedPhoto: selectedPhoto)
    }
}


extension DetailPhotoPresenter : DetailPhotoViewOutput {
    func viewDidLoad() {
        interactor.getPhotoData()
    }
    func backButtonPressed(loadedData: PhotosModel) {
        presenterOutput.sentLoadedData(loadedData: loadedData)
       
    }
}
