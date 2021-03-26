//
//  DataAssembly.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class DataAssembly: Assembly {
    func assemble(container: Container) {
        assembleManagers(in: container)
        assembleBusinessHelpers(in: container)
        assembleRepositories(in: container)
        assembleMappers(in: container)
    }
}
