//
//  PhotoCellViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 29/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation


protocol ViewCellModel {
    var photoName : String { get }
    var photoUrl : String {get}
    var id : String {get}
    var isFavorite: Bool {get}
}
