//
//  PhotosStruct.swift
//  FlickraTable
//
//  Created by Артур on 30/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit

struct PhotosModel: ViewCellModel {
    let id : String
    let title : String
    let url : String
    var isFavorite : Bool
}

