//
//  PostEntity.swift
//  FlickraTable
//
//  Created by Артур on 10/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import RealmSwift

class PostEntity: Object {
    var id: String?
    var  title: String?
    var url: String?
    var isFavorite: String?
    
}
