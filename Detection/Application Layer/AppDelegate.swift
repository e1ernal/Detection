//
//  AppDelegate.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        configure(window)
        return true
    }

    private func configure(_ window: UIWindow) {
        let viewController = DetectionViewController()
        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .label
        navigationController.viewControllers = [viewController]
        self.window = window
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
