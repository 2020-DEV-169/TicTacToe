//
//  GameManagerTests.swift
//  TicTacToeTests
//
//  Created by 2020-DEV-169 on 23/10/2020.
//

import XCTest
@testable import TicTacToe

class GameManagerTests: XCTestCase {

    func testInitialGameState() {
        let manager = GameManager()
        XCTAssertEqual(manager.state, .turn(of: .x))
    }

    func testMarkAlternatesPlayer() {
        let manager = GameManager()
        XCTAssertEqual(manager.state, .turn(of: .x))
        manager.mark(row: 0, column: 0)
        XCTAssertEqual(manager.state, .turn(of: .o))
        manager.mark(row: 1, column: 0)
        XCTAssertEqual(manager.state, .turn(of: .x))
    }

    func testCannotMarkSameItem() {
        let manager = GameManager()
        XCTAssertEqual(manager.state, .turn(of: .x))
        manager.mark(row: 0, column: 0)
        XCTAssertEqual(manager.state, .turn(of: .o))
        manager.mark(row: 0, column: 0)
        XCTAssertEqual(manager.state, .turn(of: .o))
    }
}
