//
//  DivisionModel.swift
//  NekokichiKadai5
//
//  Created by Nekokichi on 2022/04/19.
//

import UIKit

//struct CalculatableElement {
//    enum CalculateError: Error {
//        case EmptyNumeratorError
//        case EmptyDenominatorError
//        case InvalidValueError
//    }
//    private var Numerator: Int
//    private var Denominator: Int
//    func checkElements(closure: (String) -> Void) -> CalculateError {
//        do {
//            if Numerator == nil {
//                throw CalculateError.EmptyNumeratorError
//            }
//            if Denominator == nil {
//                throw CalculateError.EmptyDenominatorError
//            }
//            if Numerator == nil {
//                throw CalculateError.EmptyNumeratorError
//            }
//        } catch let error {
//            switch error {
//
//            }
//        }
//    }
//}

protocol Division {
    func result() -> Double
}

class DivisionModel: Division {
    private var Numerator: Double
    private var Denominator: Double
    init(_ numerator: Int, _ denominator: Int) {
        Numerator = Double(numerator)
        Denominator = Double(denominator)
    }
    func result() -> Double {
        Numerator / Denominator
    }
}
