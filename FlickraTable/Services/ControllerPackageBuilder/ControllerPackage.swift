//
//  ControllerPackage.swift
//  FlickraTable
//
//  Created by Артур on 23/01/2019.
//  Copyright © 2019 Артур. All rights reserved.


import Foundation
import UIKit

class ControllerPackage : ControllerPackageProtocol{
    var controller: UIViewController
    var presenter: Any
    
    init(controller:UIViewController, presenter: Any){
        self.controller = controller
        self.presenter = presenter
    }
}
