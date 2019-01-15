//
//  FavoritesInteractor.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


class FavoritesInteractor {
    private weak var interactorOutput : FavoritesInteractorOutput!
    var databse : DatabaseServiceInput!
    
    deinit{
        print("deinit FavoritesInteractor")}
    
}

extension FavoritesInteractor : FavoritesInteractorInput{
    var output: FavoritesInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}

extension FavoritesInteractor{
    func prepareData(){
        
        guard let preparedData = databse?.loadObjectsFromBase() else {return}
          interactorOutput.dataPrepared(data: preparedData)
        }
         
    
        
      
        
    }

