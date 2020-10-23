//
//  ViewModel.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 21/10/2020.
//

import Foundation

class ViewModel {
    
    private var gameManager: GameManager {
        didSet {
            self.onUpdate?()
        }
    }
    
    init(gameManager: GameManager = GameManager()) {
        self.gameManager = gameManager
    }

    var onUpdate: (() -> Void)? {
        didSet {
            self.onUpdate?()
        }
    }
    var title: String {
        switch self.gameManager.state {
        case .turn(let player):
            return player.rawValue + "'s turn"
        case .won(let player):
            return player.rawValue + " won!"
        case .draw:
            return "It's a draw"
        }
    }
    var buttons: [[Button]] {
        self.gameManager.grid.marks.enumerated().map { (row, columns) in
            columns.enumerated().map { (column, _) in
                Button(row: row, column: column)
            }
        }
    }

    func titleForMarking(row: Int, column: Int) -> String? {
        guard let mark = self.gameManager.mark(row: row, column: column) else {
            return nil
        }
        self.onUpdate?()
        return mark.title
    }

    func clearGame() {
        // Create a new GameManager instance
        self.gameManager = GameManager()
    }
}
