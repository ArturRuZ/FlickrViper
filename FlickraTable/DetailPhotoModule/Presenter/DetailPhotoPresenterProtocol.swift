//
//  DetailPhotoPresenterProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPhotoPresenterInput: class {
    var output:  DetailPhotoPresenterOutput { get set }
    var viewInput:  DetailPhotoViewInput { get set }
    var interactorInput:  DetailPhotoInteractorInput { get set }
    func getData()
    func prepareFototoShow(photo: UIImage, isFavorite: Bool)
    
}

protocol  DetailPhotoPresenterOutput: class {
    
}


