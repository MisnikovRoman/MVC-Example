//
//  NotesListViewController.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {
	private let userName: String
	private let userDefaultsService: UserDefaultsService
	private let notesRepository: INotesRepository
	private let notesListTableController = NotesListTableController()

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var tableViewPlaceholder: UIView!

	init?(coder: NSCoder,
		  userName: String,
		  userDefaultsService: UserDefaultsService,
		  notesRepository: INotesRepository) {
		self.userName = userName
		self.userDefaultsService = userDefaultsService
		self.notesRepository = notesRepository
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.setup()
		self.notesRepository.allNotes { result in
			if case let .success(notes) = result {
				self.notesListTableController.notes = notes
			}
		}
	}

	@IBAction func logoutButtonTap(_ sender: Any) {
		self.userDefaultsService.removeUserName()
		self.navigation.toLoginScreen()
	}
}

private extension NotesListViewController {
	var navigation: NotesListNavigationController {
		return self.navigationController as! NotesListNavigationController
	}

	func setup() {
		self.titleLabel.text = "\(self.userName), ваши заметки"

		self.notesListTableController.didSelectCell = { note in
			self.navigation.toNotesDetailsScreen(note: note)
		}
		
		let tableView = self.notesListTableController.tableView
		self.tableViewPlaceholder.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: self.tableViewPlaceholder.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.tableViewPlaceholder.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: self.tableViewPlaceholder.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.tableViewPlaceholder.trailingAnchor)
		])
	}
}
