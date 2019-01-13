//
//  FavoritesView.swift
//  FlickraTable
//
//  Created by Артур on 11/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
  private let kFavoritesCellNib = UINib(nibName: "FavoritesCellView", bundle: nil)
  private let kFavoritesCellReuseIdentifier = "kFavoritesCellReuseIdentifier"
  
    private var presenter : FavoritesPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Favorites"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       presenter.callback()
    }
}

extension FavoritesViewController : FavoritesViewInput {
    var presenterInput: FavoritesPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

extension FavoritesViewController {
    private func setUpUI() {
       favoritesTableView.register(kFavoritesCellNib, forCellReuseIdentifier: kFavoritesCellReuseIdentifier)
       favoritesTableView.rowHeight = UITableView.automaticDimension
       favoritesTableView.estimatedRowHeight = 118
       favoritesTableView.dataSource = self
       favoritesTableView.delegate = self
    }
}
    

extension FavoritesViewController: UITableViewDataSource {
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: kFavoritesCellReuseIdentifier,
                                                           for: indexPath) as? FavoritesCellView else {
                                                            return UITableViewCell()
            }
     
        //cell.presenter = self.presenter
       // cell.viewModel = storage?[indexPath.row]
        
        //cell.viewModel = photosResponse?.photos.photo[indexPath.row]
           
        return cell
    }
}


extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


