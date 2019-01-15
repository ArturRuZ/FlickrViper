//
//  DatabaseService.swift
//  FlickraTable
//
//  Created by Артур on 10/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseService: DatabaseServiceInput {
    
    let realm = try! Realm()
    
    /*
    func loadObjectsFromBase() -> [PostEntity] {
        var objectsArray:[PostEntity]=[]
        let objects = realm.objects(PostEntity.self)
        for i in 0..<objects.count{
            objectsArray.append(objects[i])
        }
        return objectsArray
    } */
    func loadObjectsFromBase() -> [PhotosModel] {
        var finalObjectsArray:[PhotosModel]=[]
        let searchResult = realm.objects(PostEntity.self)
        for i in 0..<searchResult.count{
            guard let id = searchResult[i].id else {return finalObjectsArray}
            guard let title = searchResult[i].title else {return finalObjectsArray}
            guard let url = searchResult[i].url else {return finalObjectsArray}
            guard let isFavorite = searchResult[i].isFavorite.value else {return finalObjectsArray}
            let photosModelObject = PhotosModel(id: id, title: title, url: url, isFavorite: isFavorite)
            finalObjectsArray.append(photosModelObject)
        }
        return finalObjectsArray
    }
    
    func uopdateObjectsStateInBase(data: PostEntity)  {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        if  data.isFavorite.value == true {saveObjectToBase(data)} else { removeObjectFromBase(data) }
    }
    
    private func saveObjectToBase(_ data: PostEntity) {
        let searchResult = realm.objects(PostEntity.self).filter("id == '\(data.id!)'")
        if searchResult.count == 0 {
            guard (data.id != nil) else {return}
            guard (data.title != nil) else {return}
            guard (data.url != nil) else {return}
            try! realm.write {
                realm.create(PostEntity.self, value:[data.id!,data.title!,data.url!, data.isFavorite.value!])
            }
        }
    }
    
    private func removeObjectFromBase(_ data: PostEntity) {
        let searchResult = realm.objects(PostEntity.self).filter("id == '\(data.id!)'")
        if searchResult.count != 0 {
            try! realm.write {
                realm.delete(searchResult)
            }
        }
    }
    
    
}

