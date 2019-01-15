//
//  FavoritesInteractorProtocol.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


protocol  FavoritesInteractorInput: class {
    var output: FavoritesInteractorOutput { get set }
    func prepareData()
    
    
}

protocol FavoritesInteractorOutput: class {
    func dataPrepared(data: [PhotosModel])
}
