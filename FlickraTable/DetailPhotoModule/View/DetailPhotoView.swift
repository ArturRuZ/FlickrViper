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


class DetailPhotoView: UIViewController {
    
    @IBOutlet weak var favoritesIcon: UIButton!
    @IBOutlet weak var detailPhotoTitle: UILabel!
    @IBOutlet weak var detailPhotoImageView: UIImageView!
    
    private var photoData: PhotosModel?
    private var viewOutput : DetailPhotoViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if photoData != nil{
            viewOutput.backButtonPressed(loadedData: photoData!)}
    }
    
    @IBAction func favoritesButton(_ sender: UIButton) {
        photoData!.isFavorite = !photoData!.isFavorite
        updatefavoriteImage()
    }

    deinit{
        print("deinit DetailPhotoView")}
}


extension DetailPhotoView : DetailPhotoViewDelegate {
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
        detailPhotoTitle.text = photoData.title
        updatefavoriteImage()
        detailPhotoImageView.kf.indicatorType = .activity
        let url = URL(string : photoData.url)
        let cacheKey = photoData.id
        let resource = ImageResource(downloadURL: url! , cacheKey: cacheKey)
        detailPhotoImageView.kf.setImage(with: resource)
    }
}


extension DetailPhotoView {
    func updatefavoriteImage(){
        let favoriteImage = UIImage(named: "baseline_favorite_black_36pt.png")
        let unfavoriteImage = UIImage(named: "baseline_favorite_border_black_36pt")
        if  photoData != nil{
            photoData!.isFavorite ? favoritesIcon.setImage(favoriteImage, for: .normal) : favoritesIcon.setImage(unfavoriteImage, for: .normal)
        }
    }
}
