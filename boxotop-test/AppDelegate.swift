//
//  AppDelegate.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // MARK: - Dependencies Injections
    private var presentationAssembly: PresentationAssembly!
    private var dataAssembly: DataAssembly!
    
    // MARK: - Navigator
    private var rootNavigationController: UINavigationController!
    private var viewControllerProvider: ViewControllerProvider!
    private var applicationRouter: Router!
    private var appNavigator: AppNavigator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        prepareDependenciesInjections()
        prepareApp()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        appNavigator.navigate(to: .initial)
        
        return true
    }
}

private extension AppDelegate {
    func prepareDependenciesInjections() {
        presentationAssembly = PresentationAssembly()
        dataAssembly = DataAssembly()
    }
    
    func prepareApp() {
        let viewControllerProvider = ViewControllerProvider(presentationAssembly: presentationAssembly, dataAssembly: dataAssembly)
        let rootNavigationController = UINavigationController()
        let applicationRouter: Router = RouterImpl(rootController: rootNavigationController)
        
        self.viewControllerProvider = viewControllerProvider
        self.rootNavigationController = rootNavigationController
        self.applicationRouter = applicationRouter
        
        let assembler = Assembler([AppAssembly()])
        appNavigator = assembler.resolver.forceResolve(AppNavigator.self, arguments: viewControllerProvider, applicationRouter)
    }
}
