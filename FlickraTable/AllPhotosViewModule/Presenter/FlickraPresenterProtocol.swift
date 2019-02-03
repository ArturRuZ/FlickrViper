//
//  FlickraPresenterProtocol.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol FlickraPresenterInput: class {
    var output: FlickraPresenterDelegate { get set }
    var viewInput: FlickraViewInput { get set }
    var interactorInput: FlickraInteractorInput { get set }
    func viewDidLoad()
    func updateData(updateData: PhotosModel)
}

protocol FlickraPresenterDelegate: class {
    func photoSelected(selectedPhoto: PhotosModel)
    func showFavorites()
}



