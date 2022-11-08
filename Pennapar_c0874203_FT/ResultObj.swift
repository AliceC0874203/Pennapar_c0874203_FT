//
//  ResultObj.swift
//  Pennapar_c0874203_FT
//
//  Created by Alice’z Poy on 2022-11-07.
//

import Foundation

protocol ResultObjProtocol {
    var number: Int { get set }
    var answerIsCorrect: Bool { get set }
    var isOdd: Bool { get set }
}

struct ResultObj: ResultObjProtocol {
    var number: Int
    var answerIsCorrect: Bool
    var isOdd: Bool
}
