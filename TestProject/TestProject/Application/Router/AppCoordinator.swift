//
//  AppCoordinator.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

var flowType: FlowType = .main {
    didSet{
        guard flowType == oldValue  else {
            DispatchQueue.main.async {
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                appdelegate.appCoordinator.switchStarterCoordinator()
            }
            return
        }
    }
}

enum FlowType {
    case main
}
class AppCoordinator: Coordinator {
    
    let window: UIWindow
    private var rootViewController: UIViewController?
    private var navigationController: UINavigationController?
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(),
         rootViewController: UIViewController? = nil,
         navigationController: UINavigationController? = nil) {
        self.window = window
        self.rootViewController = rootViewController
        self.navigationController = navigationController
        setupWindow()
        switchStarterCoordinator()
    }
    
    func setupWindow() {
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
        self.window.overrideUserInterfaceStyle = .light
    }
    
    func setupStarterCoordinator() {
        setupMainPart()
        start()
    }
    
    func switchStarterCoordinator() {
        switch flowType {
        case .main:
            setupMainPart()
        }
        start()
    }
    
    private func setupMainPart() {
        if navigationController == nil {
            navigationController = UINavigationController()
        }
        rootViewController = navigationController
        setupWindow()
        starterCoordinator = ReservationsModuleCoordinator(navigationController: rootViewController as! UINavigationController)
    }
    
    func start() {
        starterCoordinator?.start()
    }
}
