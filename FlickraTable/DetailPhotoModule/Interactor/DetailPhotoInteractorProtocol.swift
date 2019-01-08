//
//  DetailPhotoInteractorProtocol.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation


protocol  DetailPhotoInteractorInput: class {
    var output: DetailPhotoInteractorOutput { get set }
    func getData()
    
    
}

protocol DetailPhotoInteractorOutput: class {
    func presentData(storage : [PhotosModel])
}
