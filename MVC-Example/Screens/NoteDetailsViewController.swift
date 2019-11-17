//
//  NoteDetailsViewController.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController {
	var note: Note!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var descriptionTextView: UITextView!

	init?(coder: NSCoder, note: Note) {
		self.note = note
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd MMMM YYYY"

		self.titleLabel.text = self.note.title
		self.timeLabel.text = dateFormatter.string(from: self.note.time)
		self.descriptionTextView.text = note.body
	}

	@IBAction func backButtonTap(_ sender: Any) {
		self.navigation.back()
	}
}

private extension NoteDetailsViewController {
	var navigation: NoteDetailsNavigationController {
		return self.navigationController as! NoteDetailsNavigationController
	}
}
