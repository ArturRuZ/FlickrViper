//
//  FlickraViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation


protocol FlickraViewtViewDelegate: class {
    var output: FlickraViewOutput{ get set }
    func presentData(photosDataForView  : [PhotosModel])
}

protocol RoutingFlickraView: class {
    func presentFlickraView()
    func dismissFlickraView()
}

protocol FlickraViewOutput: class {
    func viewDidLoad()
    func favoritesButtonPressed()
    func rowSelected(selectedPhoto: PhotosModel)
}
