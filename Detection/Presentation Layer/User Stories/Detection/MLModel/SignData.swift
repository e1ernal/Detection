//
//  SignModelData.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

struct SignData {
    static var signs = [
        Sign.sign1(),
        Sign.sign2(),
        Sign.sign3(),
        Sign.sign4(),
        Sign.sign5(),
        Sign.sign6(),
        Sign.sign7(),
        Sign.sign8(),
        Sign.sign9(),
        Sign.sign10(),
        Sign.sign11(),
        Sign.sign12(),
        Sign.sign13(),
        Sign.sign14(),
        Sign.sign15(),
        Sign.sign16(),
        Sign.sign17(),
        Sign.sign18(),
        Sign.sign19(),
        Sign.sign20(),
        Sign.sign21(),
        Sign.sign22(),
        Sign.sign23(),
        Sign.sign24(),
        Sign.sign25(),
        Sign.sign26(),
        Sign.sign27(),
        Sign.sign28()
    ]
    
    static func getSign(by label: String) -> Sign? {
        signs.first(where: { $0.label == label })
    }
}
