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
    
    
    var viewModel: ViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            photoName.text = viewModel.photoName
            photo.kf.indicatorType = .activity
            let url = URL(string : viewModel.photoUrl)
            let cacheKey = viewModel.id
            let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
            photo.kf.setImage(with: resource)
        }
    }
}
/*
 let url = URL(string: "https://example.com/high_resolution_image.png")
 let processor = DownsamplingImageProcessor(size: imageView.size)
 >> RoundCornerImageProcessor(cornerRadius: 20)
 imageView.kf.indicatorType = .activity
 imageView.kf.setImage(
 with: resource,
 placeholder: UIImage(named: "placeholderImage"),
 options: [
 .processor(processor),
 .scaleFactor(UIScreen.main.scale),
 .transition(.fade(1)),
 .cacheOriginalImage
 ])
 {
 result in
 switch result {
 case .success(let value):
 print("Task done for: \(value.source.url?.absoluteString ?? "")")
 case .failure(let error):
 print("Job failed: \(error.localizedDescription)")
 }
 }
 he simplest use-case is setting an image to an image view with the UIImageView extension:
 
 let url = URL(string: "https://example.com/image.png")
 imageView.kf.setImage(with: url)
 Kingfisher will download the image from url, send it to both memory cache and disk cache, and display it in imageView. When you set with the same URL later, the image will be retrieved from the cache and shown immediately. */
