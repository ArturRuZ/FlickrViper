//
//  PhotosResponse.swift
//  FlickraTable
//
//  Created by Артур on 28/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation

struct PhotosResponse : Codable {
    var photos : Photos
}

struct Photos : Codable {
    var photo : [Photo]
}

struct Photo : Codable {
    var id : String
    var title : String
    var url_l : String
}


/*
 var id: String
 var owner: String
 var secret : String
 var server: String
 var farm: Int
 var title: String
 var ispublic: Int
 var isfriend: Int
 var isfamily: Int
 var url_l: String
 var height_l: String
 var width_l: String
 */

