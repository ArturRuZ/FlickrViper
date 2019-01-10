//
//  DetailPhotoView.swift
//  FlickraTable
//
//  Created by Артур on 09/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoView: UIViewController {
    
    
    @IBOutlet weak var favoritesIcon: UIButton!
    @IBOutlet weak var detailPhotoTitle: UILabel!
    @IBOutlet weak var detailPhotoImageView: UIImageView!
    
    private var savedData: ViewCellModel?
    private var presenter : DetailPhotoPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        presenter.saveChanges(savedData: savedData!)
    }
    
    
    @IBAction func favoritesButton(_ sender: UIButton) {
        savedData!.isFavorite = !savedData!.isFavorite
        
        updatefavoriteImage()
    }
    
    
    
    deinit{
        print("deinit DetailPhotoView")}
}

extension DetailPhotoView : DetailPhotoViewInput {
    var presenterInput: DetailPhotoPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

extension DetailPhotoView {
    func presentPhoto(data: ViewCellModel, photo: UIImage){
        detailPhotoImageView.image = photo
        detailPhotoTitle.text = data.title
        self.savedData = data
        updatefavoriteImage()
    }
    
    func updatefavoriteImage(){
        let favoriteImage = UIImage(named: "baseline_favorite_black_36pt.png")
        let unfavoriteImage = UIImage(named: "baseline_favorite_border_black_36pt")
        savedData!.isFavorite ? favoritesIcon.setImage(favoriteImage, for: .normal) : favoritesIcon.setImage(unfavoriteImage, for: .normal)
    }
}
