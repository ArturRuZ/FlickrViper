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
   
    
    func loadEntites() -> [PostEntity] {
        var postEntity:[PostEntity]=[]
        let entity = realm.objects(PostEntity.self).filter("isFavorite == '0'")
        for i in 0..<entity.count{
            print(entity.count)
            postEntity.append(entity[i])
        }
        return postEntity
    }
    
    func saveEntites(data: [PostEntity])  {
    //  try! realm.write {
      //  realm.deleteAll()}
         print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        for i in 0..<data.count {
            print (data.count)
            let entity = realm.objects(PostEntity.self).filter("id == '\(data[i].id!)'")
           print("id == '\(data[i].id!)'")
            print(entity.count)
            if entity.count == 0 {
              try! realm.write {
                    realm.create(PostEntity.self, value:[data[i].id,data[i].title,data[i].url, data[i].isFavorite])
                   //realm.add(data[i])
                
                }
            }
        }
    }
}

