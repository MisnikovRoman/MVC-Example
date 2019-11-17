//
//  UserDefaultsService.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import Foundation

class UserDefaultsService {
	private enum Key {
		static let username = "username"
	}

	var userName: String? {
		return UserDefaults.standard.string(forKey: Key.username)
	}

	var isUserLogged: Bool {
		return self.userName != nil
	}

	func saveUserName(name: String) {
		UserDefaults.standard.set(name, forKey: Key.username)
	}

	func removeUserName() {
		UserDefaults.standard.set(nil, forKey: Key.username)
	}
}

