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
    
    private weak var presenterOutputToCoordinator : DetailPhotoPresenterOutput!
    private weak var view : DetailPhotoViewInput!
    private var interactor: DetailPhotoInteractorInput!
    
    deinit{
        print("deinit DetailPhotoPresenter")}
    
}

extension DetailPhotoPresenter : DetailPhotoPresenterInput {
    
    var output: DetailPhotoPresenterOutput {
        get {
            return presenterOutputToCoordinator
        }
        set {
            presenterOutputToCoordinator = newValue
        }
    }
    
    var viewInput: DetailPhotoViewInput {
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
    
    func getData() {
        interactor.getData()
    }
}

extension DetailPhotoPresenter : DetailPhotoInteractorOutput {
    func presentData(data: ViewCellModel, photo: UIImage) {
        view.presentPhoto(data: data, photo: photo)
    }
    
}
extension DetailPhotoPresenter{
    func prepareFototoShow(dataCell: ViewCellModel, selectedPhoto: UIImage) {
        interactor.prepareFototoShow(dataCell: dataCell, selectedPhoto: selectedPhoto)
    }
    func saveChanges(savedData: ViewCellModel){
        presenterOutputToCoordinator.saveChanges(savedData: savedData)
    }
}
