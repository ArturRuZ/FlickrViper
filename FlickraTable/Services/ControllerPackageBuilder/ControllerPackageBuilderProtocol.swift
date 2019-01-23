//
//  ControllerPackageBuilderProtocol.swift
//  FlickraTable
//
//  Created by Артур on 23/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol ControllerPackageBuilderProtocol: class {
func createPackage<T>(type: T.Type )->(ControllerPackageProtocol?)
}
