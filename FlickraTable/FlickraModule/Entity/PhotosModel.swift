//
//  PhotosStruct.swift
//  FlickraTable
//
//  Created by Артур on 30/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

struct PhotosModel {
   
    let title : String
    let url : String
    let id : String
    
}
extension PhotosModel : ViewCellModel {
    var photoUrl: String {
        return url
    }
    
    var photoName: String {
        return title
    }
    
    
}
