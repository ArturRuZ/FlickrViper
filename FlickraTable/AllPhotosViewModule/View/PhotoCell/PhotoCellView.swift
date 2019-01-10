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


class PhotoCellView : UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var photoName: UILabel!
    
    @IBOutlet weak var favoritesIcon: UIButton!
    
    
    weak var presenter: FlickraPresenterInput?
    
    var viewModel: ViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            photoName.text = viewModel.title
            photo.kf.indicatorType = .activity
            let url = URL(string : viewModel.url)
            let cacheKey = viewModel.id
            let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
            photo.kf.setImage(with: resource)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
            photo.addGestureRecognizer(tapRecognizer)
            photo.isUserInteractionEnabled = true
            let favoriteImage = UIImage(named: "baseline_favorite_black_36pt.png")
            let unfavoriteImage = UIImage(named: "baseline_favorite_border_black_36pt")
            viewModel.isFavorite ? favoritesIcon.setImage(favoriteImage, for: .normal) : favoritesIcon.setImage(unfavoriteImage, for: .normal)
        }
    }
    
    @objc func selectImage(sender: UIGestureRecognizer){
        guard let presenter = presenter else { return }
        guard let viewModel = viewModel else { return }
        guard let photo = photo.image else { return }
        presenter.photoSelected(dataCell: viewModel, selectedPhoto: photo)
    }
}
