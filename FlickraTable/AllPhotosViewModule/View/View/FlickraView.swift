//
//  FlickraView.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import UIKit



class FlickraViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var presenter : FlickraPresenterInput!
    private let kPhotoTableViewCellNib = UINib(nibName: "PhotoCellView", bundle: nil)
    private let kPhotoTableViewCellReuseIdentifier = "kPhotoTableViewCellReuseIdentifier"
    private var storage : [PhotosModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad FlickraViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.getData()
    }
    deinit{
        print("deinit FlickraViewController")}
    
    
}

extension FlickraViewController {
    private func setUpUI() {
        
        tableView.register(kPhotoTableViewCellNib, forCellReuseIdentifier: kPhotoTableViewCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 360
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FlickraViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kPhotoTableViewCellReuseIdentifier,
                                                       for: indexPath) as? PhotoCellView else {
                                                        return UITableViewCell()
        }
        
        cell.presenter = self.presenter
        cell.viewModel = storage?[indexPath.row]
        
        //cell.viewModel = photosResponse?.photos.photo[indexPath.row]
        return cell
    }
}

extension FlickraViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}




extension FlickraViewController : FlickraViewtViewInput {
    
    
    
    var presenterInput: FlickraPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

extension FlickraViewController {
    func presentData(storage : [PhotosModel]) {
        self.storage = storage
        setUpUI()
        tableView.reloadData()
    }
} 
