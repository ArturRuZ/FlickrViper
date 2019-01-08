//
//  ModulesCoordinator.swift
//  FlickraTable
//
//  Created by Артур on 27/12/2018.
//  Copyright © 2018 Артур. All rights reserved.
//

import UIKit


class ModulesCoordinator {
    
    private var rootNavigationVC : UINavigationController
    private let internetService: InternetServiceInput
    private var presenterArray : [Any] = []
    
    
    func rootModuleController() -> UIViewController {
        presentFlickraViewt()
        return rootNavigationVC
        
    }
   
    
    init(internetService: InternetServiceInput, rootNavigationVC :UINavigationController) {
        self.internetService = internetService
        self.rootNavigationVC = rootNavigationVC
    }
}


extension ModulesCoordinator : FlickraPresenterOutput {
    
}



extension ModulesCoordinator : RoutingFlickraViewtView {
    func presentFlickraViewt() {
        let flickraAssembly = FlickraAssembly()
        guard let flickra = flickraAssembly.build(internetService: internetService) else { return}
        flickra.presenter.output = self
        presenterArray.append(flickra.presenter)
        rootNavigationVC.pushViewController(flickra.controller, animated: true)
    }
    
    func dismissFlickraView() {
         rootNavigationVC.dismiss(animated: true, completion: nil)
    }
}
