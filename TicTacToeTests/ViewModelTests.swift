//
//  ViewModelTests.swift
//  TicTacToeTests
//
//  Created by Jonas De Prins on 23/10/2020.
//

import XCTest
@testable import TicTacToe

class ViewModelTests: XCTestCase {

    func testTitle() {
        let gameManager = MockGameManager()
        let viewModel = ViewModel(gameManager: gameManager)
        XCTAssertEqual(viewModel.title, "X's turn")
        gameManager._state = .turn(of: .o)
        XCTAssertEqual(viewModel.title, "O's turn")
        gameManager._state = .won(player: .x)
        XCTAssertEqual(viewModel.title, "X won!")
        gameManager._state = .won(player: .o)
        XCTAssertEqual(viewModel.title, "O won!")
        gameManager._state = .draw
        XCTAssertEqual(viewModel.title, "It's a draw")
    }

    func testTitleForMarking() {
        let gameManager = MockGameManager()
        let viewModel = ViewModel(gameManager: gameManager)
        gameManager.mark = .empty
        XCTAssertEqual(viewModel.titleForMarking(row: 0, column: 0), "")
        gameManager.mark = .marked(by: .x)
        XCTAssertEqual(viewModel.titleForMarking(row: 0, column: 0), "X")
        gameManager.mark = .marked(by: .o)
        XCTAssertEqual(viewModel.titleForMarking(row: 0, column: 0), "O")
    }
}

private class MockGameManager: GameManager {
    var _state: GameManager.GameState = .turn(of: .x)
    override var state: GameManager.GameState {
        return self._state
    }

    var mark: Grid.Mark?
    override func mark(row: Int, column: Int) -> Grid.Mark? {
        return self.mark
    }
}
