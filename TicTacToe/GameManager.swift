//
//  GameManager.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 23/10/2020.
//

import Foundation

class GameManager {

    enum GameState: Equatable {
        case turn(of: Player)
        case won(player: Player)
        case draw
    }

    private(set) var state: GameState = .turn(of: .x)

    let grid: Grid

    init(grid: Grid = Grid(size: Constants.gridSize)) {
        self.grid = grid
    }

    @discardableResult func mark(row: Int, column: Int) -> Grid.Mark? {
        guard
            case .turn(let currentPlayer) = self.state,
            let mark = self.grid.mark(row: row, column: column, by: currentPlayer)
        else {
            return nil
        }

        switch self.grid.result {
        case .undefined:
            self.state = .turn(of: currentPlayer.nextPlayer)
        case .won(let player):
            self.state = .won(player: player)
        case .draw:
            self.state = .draw
        }
        return mark
    }
}
