//
//  DivisionModel.swift
//  NekokichiKadai5
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

protocol Calculatable {
    func result(value1: Int, value2: Int) -> Double
}

// 割り算を行うクラス
final class Division: Calculatable {
    func result(value1: Int, value2: Int) -> Double {
        Double(value1) / Double(value2)
    }
}
