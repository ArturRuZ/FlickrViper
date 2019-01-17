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
    
    private var viewOutput : FlickraViewOutput!
    private let kPhotoTableViewCellNib = UINib(nibName: "PhotoCellView", bundle: nil)
    private let kPhotoTableViewCellReuseIdentifier = "kPhotoTableViewCellReuseIdentifier"
    private var photosDataForView : [PhotosModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad FlickraViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Flickr Photos"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:(UIImage(named: "baseline_view_headline_black_36pt")), style: .done, target: self, action: #selector(favoritesButtonPressed))
        viewOutput.viewDidLoad()
    }
    
    deinit{
        print("deinit FlickraViewController")}
    
    @objc func favoritesButtonPressed() {
        viewOutput.favoritesButtonPressed()
    }
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
        return photosDataForView?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kPhotoTableViewCellReuseIdentifier,
                                                       for: indexPath) as? PhotoCellView else {
                                                        return UITableViewCell()
        }
        cell.viewModel = photosDataForView?[indexPath.row]
        return cell
    }
}


extension FlickraViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if photosDataForView?[indexPath.row] != nil {
            viewOutput.rowSelected(selectedPhoto: (photosDataForView?[indexPath.row])!)
        }
    }
}


extension FlickraViewController : FlickraViewtViewDelegate {
    var output: FlickraViewOutput {
        get {
            return viewOutput
        }
        set {
            viewOutput = newValue
        }
    }
}


extension FlickraViewController {
    func presentData(photosDataForView  : [PhotosModel]) {
        self.photosDataForView = photosDataForView 
        setUpUI()
        tableView.reloadData()
    }
} 
