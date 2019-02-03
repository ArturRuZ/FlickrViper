//
//  PhotoCellViewProtocol.swift
//  FlickraTable
//
//  Created by Артур on 29/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCellModel {
    var title : String { get }
    var url : String {get}
    var id : String {get}
    var isFavorite: Bool {get set}
    
}
