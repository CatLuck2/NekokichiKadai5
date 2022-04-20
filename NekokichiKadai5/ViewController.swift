//
//  ViewController.swift
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

final class ViewController: UIViewController {

    enum Result<T, Error: Swift.Error> {
        case success(T)
        case failure(Error)
    }

    enum ValueError: Error {
        case emptyNumeratorError
        case emptyDenominatorError
        case foundZeroInNumeratorError
        case foundZeroInDenominatorError
    }

    @IBOutlet weak private var inputNumeratorField: UITextField!
    @IBOutlet weak private var inputDenominatorField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func divisionButton(_ sender: UIButton) {
        switch checkInputValue() {
        case .success:
            break
        case .failure(.emptyNumeratorError):
            alert(message: "割る数を入力してください")
        case .failure(.emptyDenominatorError):
            alert(message: "割られる数を入力してください")
        case .failure(.foundZeroInNumeratorError):
            alert(message: "割る数には0以外を入力してください")
        case .failure(.foundZeroInDenominatorError):
            alert(message: "割られる数には0以外を入力してください")
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
