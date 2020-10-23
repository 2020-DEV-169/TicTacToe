//
//  Grid.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 23/10/2020.
//

import Foundation

class Grid {

    enum Mark: Equatable {
        case empty, marked(by: Player)

        var title: String {
            switch self {
            case .empty: return ""
            case .marked(let player): return player.rawValue
            }
        }
    }

    enum Result: Equatable {
        case undefined, won(by: Player), draw
    }

    private let size: Int
    private(set) var marks: [[Mark]]

    var result: Result {
        for player in Player.allCases {
            if self.didPlayerWin(player: player) {
                return .won(by: player)
            }
        }
        if self.marks.flatMap({ $0 }).contains(.empty) {
            return .undefined
        }
        return .draw
    }

    init(size: Int) {
        self.size = size
        self.marks = {
            return (0 ..< size).map { _ in
                (0 ..< size).map { _ in .empty }
            }
        }()
    }

    @discardableResult func mark(row: Int, column: Int, by player: Player) -> Mark? {
        guard self.marks[row][column] == .empty else {
            return nil
        }
        let mark: Mark = .marked(by: player)
        self.marks[row][column] = mark
        return mark
    }

    private func didPlayerWin(player: Player) -> Bool {
        // Check rows
        for row in 0 ..< self.size {
            if self.marks[row].isOnly(of: .marked(by: player)) {
                return true
            }
        }

        // Check columns
        for row in 0 ..< self.size {
            let columns = self.marks.map { $0[row] }
            if columns.isOnly(of: .marked(by: player)) {
                return true
            }
        }

        // Check diagonal \
        let diagonal1Marks: [Mark] = (0..<self.size).map { self.marks[$0][$0] }
        if diagonal1Marks.isOnly(of: .marked(by: player)) {
            return true
        }

        // Check diagonal /
        let diagonal2Marks: [Mark] = (0..<self.size).map { row in
            let column = self.size - row - 1
            return self.marks[row][column]
        }
        if diagonal2Marks.isOnly(of: .marked(by: player)) {
            return true
        }

        // No winning matches found
        return false
    }
}

private extension Array where Element: Equatable {
    func isOnly(of element: Element) -> Bool {
        self.first(where: { $0 != element }) == nil
    }
}

private extension ArraySlice where Element: Equatable {
    func isOnly(of element: Element) -> Bool {
        self.first(where: { $0 != element }) == nil
    }
}

