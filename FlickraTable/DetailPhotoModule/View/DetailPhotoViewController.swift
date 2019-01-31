//
//  DetailPhotoView.swift
//  FlickraTable
//
//  Created by Артур on 09/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import ReactiveCocoa
import ReactiveSwift


class DetailPhotoViewController: UIViewController {
    
    @IBOutlet weak var favoritesIcon: UIButton!
    @IBOutlet weak var detailPhotoTitle: UILabel!
    @IBOutlet weak var detailPhotoImageView: UIImageView!
    
    private var photoData: PhotosModel?
    private var viewOutput : DetailPhotoViewOutput!
    private var favorite = MutableProperty(false)
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("didload")
        output.viewDidLoad()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if photoData != nil{
            viewOutput.backButtonPressed(loadedData: photoData!)}
    }
    
    @IBAction func favoritesButton(_ sender: UIButton) {
        photoData!.isFavorite = !photoData!.isFavorite
        self.favorite.value = self.photoData!.isFavorite
    }
   
    
    deinit{
        print("deinit DetailPhotoView")}
}


extension DetailPhotoViewController : DetailPhotoViewDelegate {
    var output: DetailPhotoViewOutput {
        get {
            return viewOutput
        }
        set {
            viewOutput = newValue
        }
    }
    
    func presentPhoto(photoData: PhotosModel) {
        self.photoData = photoData
        
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
        detailPhotoTitle.text = photoData.title
        self.favorite.value = photoData.isFavorite
        detailPhotoImageView.kf.indicatorType = .activity
        let url = URL(string : photoData.url)
        let cacheKey = photoData.id
        let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
        detailPhotoImageView.kf.setImage(with: resource)
    }
}

