//
//  GridTests.swift
//  TicTacToeTests
//
//  Created by 2020-DEV-169 on 23/10/2020.
//

import XCTest
@testable import TicTacToe

class GridTests: XCTestCase {

    func testResultWon() {
        // Row ---
        let gridRow = Grid(size: 3)
        XCTAssertEqual(gridRow.result, .undefined)
        gridRow.mark(row: 0, column: 0, by: .x)
        XCTAssertEqual(gridRow.result, .undefined)
        gridRow.mark(row: 0, column: 1, by: .x)
        XCTAssertEqual(gridRow.result, .undefined)
        gridRow.mark(row: 0, column: 2, by: .x)
        XCTAssertEqual(gridRow.result, .won(by: .x))

        // Column |
        let gridColumn = Grid(size: 3)
        XCTAssertEqual(gridColumn.result, .undefined)
        gridColumn.mark(row: 0, column: 0, by: .x)
        XCTAssertEqual(gridColumn.result, .undefined)
        gridColumn.mark(row: 1, column: 0, by: .x)
        XCTAssertEqual(gridColumn.result, .undefined)
        gridColumn.mark(row: 2, column: 0, by: .x)
        XCTAssertEqual(gridColumn.result, .won(by: .x))

        // Diagonal \
        let gridDiagonal1 = Grid(size: 3)
        XCTAssertEqual(gridDiagonal1.result, .undefined)
        gridDiagonal1.mark(row: 0, column: 0, by: .x)
        XCTAssertEqual(gridDiagonal1.result, .undefined)
        gridDiagonal1.mark(row: 1, column: 1, by: .x)
        XCTAssertEqual(gridDiagonal1.result, .undefined)
        gridDiagonal1.mark(row: 2, column: 2, by: .x)
        XCTAssertEqual(gridDiagonal1.result, .won(by: .x))

        // Diagonal /
        let gridDiagonal2 = Grid(size: 3)
        XCTAssertEqual(gridDiagonal2.result, .undefined)
        gridDiagonal2.mark(row: 0, column: 2, by: .x)
        XCTAssertEqual(gridDiagonal2.result, .undefined)
        gridDiagonal2.mark(row: 1, column: 1, by: .x)
        XCTAssertEqual(gridDiagonal2.result, .undefined)
        gridDiagonal2.mark(row: 2, column: 0, by: .x)
        XCTAssertEqual(gridDiagonal2.result, .won(by: .x))
    }

    func testResultDraw() {
        let size = 3
        let grid = Grid(size: size)
        var player: Player = .x
        for row in [0, 2, 1] {
            for column in 0 ..< size {
                grid.mark(row: row, column: column, by: player)
                player = player.nextPlayer
            }
        }
        XCTAssertEqual(grid.result, .draw)
    }
}
