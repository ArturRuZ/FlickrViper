//
//  FlickraPresenter.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit

class FlickraPresenter {
    
    private weak var presenterOutput : FlickraPresenterOutput!
    private weak var view : FlickraViewtViewDelegate!
    private var interactor: FlickraInteractorInput!
    
}

extension FlickraPresenter : FlickraPresenterInput {
    
    var output: FlickraPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: FlickraViewtViewDelegate {
        get {
            return view
        }
        set {
            view = newValue
        }
        
    }
    
    var interactorInput: FlickraInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}


extension FlickraPresenter : FlickraInteractorOutput {
    func presentData(storage : [PhotosModel]){
        view.presentData(photosDataForView : storage)
    }
}


extension FlickraPresenter: FlickraViewOutput {
    func viewDidLoad() {
        interactorInput.getData()
    }
    func  rowSelected(selectedPhoto: PhotosModel) {
        presenterOutput?.photoSelected(selectedPhoto: selectedPhoto)
    }
}


extension FlickraPresenter{
    
    func updateData(updateData: PhotosModel){
        interactor.updateData(updateData: updateData)
    }
    func favoritesButtonPressed(){
        presenterOutput.showFavorites()
    }
}

