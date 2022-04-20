//
//  DivisionModel.swift
//  NekokichiKadai5
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

protocol Calculatable {
    func result() -> Double
}

final class Division: Calculatable {
    private var numerator: Double
    private var denominator: Double
    init(numerator numeratorValue: Int, denominator denominatorValue: Int) {
        numerator = Double(numeratorValue)
        denominator = Double(denominatorValue)
    }
    func result() -> Double {
        numerator / denominator
    }
}

final class Calculator {
    private var method: Calculatable
    init(_ method: Calculatable) {
        self.method = method
    }
    func result() -> Double {
        method.result()
    }
}
