//
//  Button.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 21/10/2020.
//

import UIKit

class Button: UIButton {

    let row: Int
    let column: Int

    init(row: Int, column: Int) {
        self.row = row
        self.column = column
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        self.column = 0
        self.row = 0
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.setTitleColor(.systemBlue, for: .normal)
        self.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.secondarySystemFill.cgColor
    }
}
