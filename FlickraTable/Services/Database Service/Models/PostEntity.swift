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
 @objc dynamic var id: String?
 @objc dynamic var  title: String?
  @objc dynamic var url: String?
   var isFavorite = RealmOptional<Bool>()
    
}
/*
extension PostEntity: ViewCellModel {
    var isFavorite: Bool {
        get {
            if isInFavorites.value == nil {isInFavorites.value = false}
            return isInFavorites.value!
        }
        set {
            isInFavorites.value = newValue
        }
}
*/
