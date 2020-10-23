//
//  Player.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 23/10/2020.
//

enum Player: String, CaseIterable {
    case x = "X"
    case o = "O"

    var nextPlayer: Player {
        switch self {
        case .x: return .o
        case .o: return .x
        }
    }
}
