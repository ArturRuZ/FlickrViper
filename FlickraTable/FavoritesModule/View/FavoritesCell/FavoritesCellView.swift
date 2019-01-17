//
//  FavoritesCellView.swift
//  FlickraTable
//
//  Created by Артур on 13/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class FavoritesCellView: UITableViewCell{
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    
    var viewModel: ViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            photoTitle.lineBreakMode = .byWordWrapping
            photoTitle.numberOfLines = 2
            photoTitle.text = viewModel.title
            print(viewModel.title)
            photo.kf.indicatorType = .activity
            let url = URL(string : viewModel.url)
            let cacheKey = viewModel.id
            let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
            photo.kf.setImage(with: resource)
        }
    }
}
