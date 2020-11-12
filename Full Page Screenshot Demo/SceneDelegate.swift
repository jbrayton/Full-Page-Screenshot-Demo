//
//  SceneDelegate.swift
//  Full Page Screenshot Demo
//
//  Created by John Brayton on 11/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewController: ViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.setupViewController(windowScene: windowScene)
    }

    private func setupViewController( windowScene: UIWindowScene ) {
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = ViewController()
        window.rootViewController = rootViewController
        self.window = window
        self.viewController = rootViewController
        window.makeKeyAndVisible()
    }

}

