//
//  ViewControllerFactory.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class ViewControllerFactory {
	private let userDefaultsService: UserDefaultsService
	private let notesRepository: INotesRepository
	private let storyboard = UIStoryboard(name: "Main", bundle: nil)

	init(userDefaultsService: UserDefaultsService,
		 notesRepository: INotesRepository) {
		self.userDefaultsService = userDefaultsService
		self.notesRepository = notesRepository
	}

	func loginVC() -> LoginViewController {
		return self.storyboard.instantiateViewController(identifier: "LoginViewController") { coder in
			return LoginViewController(coder: coder, userDefaultsService: self.userDefaultsService)
		}
	}

	func notesVC(userName: String) -> NotesListViewController {
		return self.storyboard.instantiateViewController(identifier: "NotesListViewController") { coder in
			return NotesListViewController(
				coder: coder,
				userName: userName,
				userDefaultsService: self.userDefaultsService,
				notesRepository: self.notesRepository
			)
		}
	}

	func noteDetailsVC(note: Note) -> NoteDetailsViewController {
		return self.storyboard.instantiateViewController(identifier: "NoteDetailsViewController") { coder in
			return NoteDetailsViewController(coder: coder, note: note)
		}
	}
}
