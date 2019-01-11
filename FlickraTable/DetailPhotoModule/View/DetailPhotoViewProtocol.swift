//
//  DetailPhotoViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPhotoViewInput: class {
    var presenterInput: DetailPhotoPresenterInput { get set }
    func presentPhoto(data: ViewCellModel, photo: UIImage)
    
}

protocol RoutingDetailPhotoView: class {
    func presentDetailPhotoView()
    func dismissDetailPhotoView()
}
