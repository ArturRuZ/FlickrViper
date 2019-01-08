//
//  DetailPhotoView.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoView {
    
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var detailPhotoTitle: UILabel!
    @IBOutlet weak var detailPhotoImage: UIImageView!
    
    private var presenter : DetailPhotoPresenterInput!
    
}
