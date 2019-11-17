//
//  NotesService.swift
//  MVC-Example
//
//  Created by MisnikovRoman on 17.11.2019.
//  Copyright © 2019 MisnikovRoman. All rights reserved.
//

import Foundation

typealias NotesResult = Result<[Note], NSError>

protocol INotesRepository {
	func allNotes(completion: @escaping (NotesResult)->())
	func delete(_ note: Note, completion: @escaping ()->())
	func add(_ note: Note)
}

class NotesRepository {
	private var notes: [Note] = [
		Note(title: "Купить в магазине еды",
			 time: Date(),
			 body: "Молоко \nХлеб \nСметанка \nЧоколатька"),
		Note(title: "Погроммирование",
			 time: Date(),
			 body: """
			Сцепленность Связанность - термины из теории графов
			DI (инверсия зависимостей)
			перенаправление потока в обратную сторону
			Внедрение зависимостей - зависимости должны приходить извне, а не создаваться внутри
			Statefull stateless - ентити (2), а первое управляет своим состоянием (флаги)
			"""),
		Note(title: "Купить в магазине еды",
			 time: Date(),
			 body: "Молоко \nХлеб \nСметанка \nЧоколатька"),
		Note(title: "Купить в магазине еды",
			 time: Date(),
			 body: "Молоко \nХлеб \nСметанка \nЧоколатька"),
		Note(title: "Купить в магазине еды",
			 time: Date(),
			 body: "Молоко \nХлеб \nСметанка \nЧоколатька"),
	]
}

extension NotesRepository: INotesRepository {
	func allNotes(completion: @escaping (NotesResult) -> ()) {
		completion(.success(self.notes))
	}

	func delete(_ note: Note, completion: @escaping () -> ()) {
		self.notes = self.notes.filter { $0.title != note.title }
		completion()
	}

	func add(_ note: Note) {
		self.notes.append(note)
	}
}
