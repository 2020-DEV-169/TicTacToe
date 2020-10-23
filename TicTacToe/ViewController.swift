//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-169 on 21/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.onUpdate = self.updateView
        self.setupGame()
    }
    
    private func updateView() {
        self.title = viewModel.title
    }

    @IBAction func didTapButton(_ sender: Button) {
        guard let title = self.viewModel.titleForMarking(row: sender.row, column: sender.column) else { return }
        sender.setTitle(title, for: .normal)
    }
    
    @IBAction func didTapClear(_ sender: Any) {
        self.viewModel.clearGame()
        self.setupGame()
    }

    private func setupGame() {
        self.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        self.stackView.arrangedSubviews.forEach(self.stackView.removeArrangedSubview)
        self.viewModel.buttons.forEach { rowButtons in
            rowButtons.forEach { button in
                button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
            }
            let rowStackView = UIStackView(arrangedSubviews: rowButtons)
            rowStackView.distribution = .fillEqually
            self.stackView.addArrangedSubview(rowStackView)
        }
    }
}

