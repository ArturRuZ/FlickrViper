//
//  DatabaseServiceProtocols.swift
//  FlickraTable
//
//  Created by Артур on 10/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DatabaseServiceInput: class{
    func loadObjectsFromBase() -> [PhotosModel]
    func uopdateObjectsStateInBase(data: PostEntity) 
}
