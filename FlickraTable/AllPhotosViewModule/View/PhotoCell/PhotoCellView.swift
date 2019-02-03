//
//  PhotoCellView.swift
//  FlickraTable
//
//  Created by Артур on 29/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import ReactiveSwift
import ReactiveCocoa

class PhotoCellView : UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var favoritesIcon: UIButton!
    
    var viewModel: ViewCellModel? {
        didSet {
          let favorite = MutableProperty(false)
            favorite.signal.observeValues{
                switch $0{
                case true:
                    print("reactive \($0)")
                    return  self.favoritesIcon.setImage(UIImage(named: "baseline_favorite_black_36pt.png"), for: .normal)
                case false:
                    print("reactive \($0)")
                    return  self.favoritesIcon.setImage(UIImage(named: "baseline_favorite_border_black_36pt"), for: .normal)
                }
            }
            guard let viewModel = viewModel else { return }
            photoName.text = viewModel.title
            favorite.value = viewModel.isFavorite
            photo.kf.indicatorType = .activity
            let url = URL(string : viewModel.url)
            let cacheKey = viewModel.id
            let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
            photo.kf.setImage(with: resource)
        }
    }
}
