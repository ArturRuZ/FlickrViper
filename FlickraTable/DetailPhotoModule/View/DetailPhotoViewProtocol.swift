//
//  DetailPhotoViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailPhotoViewInput: class {
    var presenterInput: DetailPhotoPresenterInput { get set }

    
}

protocol RoutingDetailPhotoView: class {
    func presentFlickraViewt()
    func dismissFlickraView()
}
