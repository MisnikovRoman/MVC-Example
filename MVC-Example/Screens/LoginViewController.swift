//
//  ViewController.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	private let hintAlert = Alert(title: "Подсказка", body: "Введите свое имя")
	private let userDefaultsService: UserDefaultsService
	@IBOutlet weak var userNameTextField: UITextField!

	init?(coder: NSCoder, userDefaultsService: UserDefaultsService) {
		self.userDefaultsService = userDefaultsService
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@IBAction func continueButtonTap(_ sender: Any) {
		if let userName = self.userNameTextField.text, userName != "" {
			self.userDefaultsService.saveUserName(name: userName)
			self.navigation.toNotesListScreen(userName: userName)
		} else {
			self.navigation.informationAlert(self.hintAlert)
		}
	}
}

private extension LoginViewController {
	var navigation: LoginNavigationController {
		return self.navigationController as! LoginNavigationController
	}
}
