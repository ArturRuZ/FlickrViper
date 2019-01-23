//
//  ControllerPackageProtocol.swift
//  FlickraTable
//
//  Created by Артур on 23/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation
import UIKit

protocol ControllerPackageProtocol: class{
   var controller: UIViewController {get set}
   var presenter: Any {get set}
}
