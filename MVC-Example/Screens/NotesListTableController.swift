//
//  NotesTableViewController.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class NotesListTableController: NSObject {
	var notes: [Note] = [] {
		didSet { self.tableView.reloadData() }
	}
	var tableView = UITableView()
	var didSelectCell: ((Note) -> Void)?

	override init() {
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		super.init()
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
}

extension NotesListTableController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.notes.count
    }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let note = self.notes[indexPath.row]
		let formatter = DateFormatter()
		formatter.dateFormat = "dd MMMM YYYY"

		let cell = tableView.dequeueReusableCell(withIdentifier: ReuseId.noteCell)
			?? UITableViewCell(style: .subtitle, reuseIdentifier: ReuseId.noteCell)
		cell.textLabel?.text = note.title
		cell.detailTextLabel?.text = formatter.string(from: note.time)
        return cell
    }
}

extension NotesListTableController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.didSelectCell?(self.notes[indexPath.row])
	}
}
