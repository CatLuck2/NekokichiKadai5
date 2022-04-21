//
//  ViewController.swift
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

final class ViewController: UIViewController {

    private enum Result<T, Error: Swift.Error> {
        case success(T)
        case failure(Error)
    }

    private enum ValueError: Error {
        case emptyNumeratorError
        case emptyDenominatorError
        case foundZeroInNumeratorError
        case foundZeroInDenominatorError
    }

    @IBOutlet weak private var inputNumeratorField: UITextField!
    @IBOutlet weak private var inputDenominatorField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    private var calculator: Calculator!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumeratorField.keyboardType = .numberPad
        inputDenominatorField.keyboardType = .numberPad
    }

    @IBAction func divisionButton(_ sender: UIButton) {
        switch checkInputValue() {
        case .success:
            let numeratorValue = Int(inputNumeratorField.text!)!
            let denominatorValue = Int(inputDenominatorField.text!)!
            calculator = Calculator(Division(numerator: numeratorValue, denominator: denominatorValue))
            resultLabel.text = "\(calculator.result())"
        case .failure(.emptyNumeratorError):
            alert(message: "割る数を入力してください")
        case .failure(.emptyDenominatorError):
            alert(message: "割られる数を入力してください")
        case .failure(.foundZeroInNumeratorError):
            alert(message: "割る数には0を入力しないでください")
        case .failure(.foundZeroInDenominatorError):
            alert(message: "割られる数には0を入力しないでください")
        }
    }

    private func checkInputValue() -> Result<Void, ValueError> {
        if inputNumeratorField.text == "" { return .failure(.emptyNumeratorError) }
        if inputDenominatorField.text == "" { return .failure(.emptyDenominatorError) }
        if (Int(inputNumeratorField.text ?? "") ?? 0) == 0 { return .failure(.foundZeroInNumeratorError) }
        if (Int(inputDenominatorField.text ?? "") ?? 0) == 0 { return .failure(.foundZeroInDenominatorError) }
        return .success(())
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
