//
//  NavigationController.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

protocol LoginNavigationController: AnyObject {
	func toNotesListScreen(userName: String)
	func informationAlert(_ alert: Alert)
}

protocol NotesListNavigationController: AnyObject {
	func toNotesDetailsScreen(note: Note)
	func toLoginScreen()
	func back()
}

protocol NoteDetailsNavigationController: AnyObject {
	func back()
}

class NavigationController: UINavigationController {
	private let viewControllerFactory: ViewControllerFactory

	init(viewControllerFactory: ViewControllerFactory, userName: String? = nil) {
		self.viewControllerFactory = viewControllerFactory
		if let userName = userName {
			let vc = viewControllerFactory.notesVC(userName: userName)
			super.init(rootViewController: vc)
		} else {
			let vc = viewControllerFactory.loginVC()
			super.init(rootViewController: vc)
		}
	}

	@available (*, unavailable)
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func toNotesListScreen(userName: String) {
		let notesVC = self.viewControllerFactory.notesVC(userName: userName)
		self.pushViewController(notesVC, animated: true)
	}

	func toNotesDetailsScreen(note: Note) {
		let notesDetailsVC = self.viewControllerFactory.noteDetailsVC(note: note)
		self.pushViewController(notesDetailsVC, animated: true)
	}

	func toLoginScreen() {
		let loginVC = self.viewControllerFactory.loginVC()
		self.viewControllers.insert(loginVC, at: 0)
		self.popToRootViewController(animated: true)
	}

	func back() {
		self.popViewController(animated: true)
	}

	func informationAlert(_ alert: Alert) {
		let alertController = UIAlertController(title: alert.title,
												message: alert.body,
												preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "Ок",
												style: .cancel,
												handler: nil))
		self.present(alertController, animated: true)
	}
}

extension NavigationController: LoginNavigationController {}
extension NavigationController: NotesListNavigationController {}
extension NavigationController: NoteDetailsNavigationController {}
