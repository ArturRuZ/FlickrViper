//
//  BuildingParametrs.swift
//  FlickraTable
//
//  Created by Артур on 01/02/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

enum BuildingParametrs<T>{
 case wihoutParametrs(type: T.Type)
 case withParametrs (type: T.Type, selectedPhoto: PhotosModel)
 }
