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
    var output: FlickraPresenterOutput { get set }
    var viewInput: FlickraViewtViewInput { get set }
    var interactorInput: FlickraInteractorInput { get set }
    func getData()
    func photoSelected(photo : UIImage, isFavorite: Bool)
}

protocol FlickraPresenterOutput: class {
    func photoSelected(photo: UIImage, isFavorite: Bool)
}



