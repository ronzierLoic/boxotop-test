//
//  ViewControllerProvider.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit
import Swinject

class ViewControllerProvider {
    private let presentationAssembly: PresentationAssembly
    private let dataAssembly: DataAssembly
    
    private let sharedContainer: Container
    
    init(presentationAssembly: PresentationAssembly, dataAssembly: DataAssembly) {
        self.presentationAssembly = presentationAssembly
        self.dataAssembly = dataAssembly
        
        sharedContainer = Container()
        self.presentationAssembly.assemble(container: sharedContainer)
        self.dataAssembly.assemble(container: sharedContainer)
    }
}

extension ViewControllerProvider {
    func initialViewControler() -> Presentable {
        let assembler = Assembler([MovieListAssembly()], container: sharedContainer)
        return assembler.resolver.forceResolve(MovieListViewController.self)
    }
}
