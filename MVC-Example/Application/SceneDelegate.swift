//
//  SceneDelegate.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		let userDefaultsService = UserDefaultsService()
		let notesRepository: INotesRepository = NotesRepository()
		let viewControllerFactory = ViewControllerFactory(userDefaultsService: userDefaultsService,
														  notesRepository: notesRepository)

		let navigationController: NavigationController
		if let userName = userDefaultsService.userName {
			navigationController = NavigationController(viewControllerFactory: viewControllerFactory,
														userName: userName)
		} else {
			navigationController = NavigationController(viewControllerFactory: viewControllerFactory)
		}
		navigationController.setNavigationBarHidden(true, animated: false)
		
		if let scene = (scene as? UIWindowScene) {
			self.window = UIWindow(windowScene: scene)
			self.window?.rootViewController = navigationController
			self.window?.makeKeyAndVisible()
		}
	}
}

