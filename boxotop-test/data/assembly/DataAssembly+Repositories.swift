//
//  DataAssembly+Repositories.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

extension DataAssembly {
    func assembleRepositories(in container: Container) {
        container.register(MovieRepository.self) { resolver in
            MovieRepository(apiManager: resolver.forceResolve(ApiManager.self))
        }
        .inObjectScope(.container)
    }
}
