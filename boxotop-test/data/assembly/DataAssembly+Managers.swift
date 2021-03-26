//
//  DataAssembly+Managers.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

extension DataAssembly {
    func assembleManagers(in container: Container) {
        container.register(ApiManager.self) { _ in
            ApiManagerImpl()
        }
        .inObjectScope(.container)
    }
}
