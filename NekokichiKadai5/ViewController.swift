//
//  ViewController.swift
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

final class ViewController: UIViewController {

    private enum ValueError: Error {
        // 割る数がないエラー
        case emptyNumeratorError
        // 割られる数がないエラー
        case emptyDenominatorError
        // 割る数が0のエラー
        case denominatorIsZeroError
    }

    @IBOutlet weak private var inputNumeratorField: UITextField!
    @IBOutlet weak private var inputDenominatorField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    // 計算ボタンを押下時に処理を実行するので、初期化はまだ
    private var calculator: Calculatable = Division()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 数字しか入力できないよう設定
        inputNumeratorField.keyboardType = .numberPad
        inputDenominatorField.keyboardType = .numberPad
    }

    @IBAction func divisionButton(_ sender: UIButton) {
        switch checkInputValue() {
        case .success:
            // 入力値が有効な数値だと保証されてるので、強制アンラップ
            let numeratorValue = Int(inputNumeratorField.text!) ?? 0
            let denominatorValue = Int(inputDenominatorField.text!) ?? 0
            resultLabel.text = "\(calculator.result(value1: numeratorValue, value2: denominatorValue))"
        case .failure(.emptyNumeratorError):
            alert(message: "割られる数を入力してください")
        case .failure(.emptyDenominatorError):
            alert(message: "割る数を入力してください")
        case .failure(.denominatorIsZeroError):
            alert(message: "割る数には0を入力しないでください")
        }
    }

    private func checkInputValue() -> Result<Void, ValueError> {
        // 入力値が空か
        guard !(inputNumeratorField.text ?? "").isEmpty else { return .failure(.emptyNumeratorError) }
        guard !(inputDenominatorField.text ?? "").isEmpty else { return .failure(.emptyDenominatorError) }
        // 入力値が0か
        // 文字列を入力した場合のエラー処理がわかりませんでした
        guard Int(inputNumeratorField.text ?? "") != nil else { return .failure(.emptyNumeratorError) }
        guard let denominator = Int(inputDenominatorField.text ?? "") else { return .failure(.emptyDenominatorError) }

        guard denominator != 0 else { return .failure(.denominatorIsZeroError) }

        // 成功
        return .success(())
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
