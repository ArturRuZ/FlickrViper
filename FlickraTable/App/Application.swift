//
//  Application.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import UIKit

// MARK: - Properties

class Application {
    private let modulesCoordinator: ModulesCoordinator
    
    init() {
        modulesCoordinator = ModulesCoordinator(internetService: InternetService(),database: DatabaseService())
    }
}

// MARK: - Initialization

extension Application {
    func rootViewController() -> UIViewController {
        return modulesCoordinator.rootModuleController()
    }
}

