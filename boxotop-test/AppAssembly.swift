//
//  AppAssembly.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppNavigator.self) { (_, viewControllerProvider: ViewControllerProvider, router: Router) in
            AppNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }
    }
}
