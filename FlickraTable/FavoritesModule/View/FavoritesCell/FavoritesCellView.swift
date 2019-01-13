//
//  FavoritesCellView.swift
//  FlickraTable
//
//  Created by Артур on 13/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit


class FavoritesCellView: UITableViewCell{
    

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var photoTitle: UILabel!
    
    var title: String? {
        didSet {
    photoTitle.text = title
}
}
}
