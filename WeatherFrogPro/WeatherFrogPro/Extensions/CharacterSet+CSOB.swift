//
//  CharacterSet+CSOB.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 19/07/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension CharacterSet {
    static var paymentDigits = CharacterSet(
        charactersIn: "0123456789"
    )
    static var paymentAlphaLowercase = CharacterSet(
        charactersIn: "abcdefghijklmnopqrstuvwxyz"
    )
    static var paymentAlphaUppercase = CharacterSet(
        charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    )
    static var paymentDiacritics = CharacterSet(
        charactersIn: "üýÁÄÉÍÓÔÖÚÜÝáäéíóôöúČčĎďĚěĹĺĽľŇňŔŕŘřŠšŤťŮůŽž"
    )
    static var paymentSymbolsDomestic = CharacterSet(
        charactersIn: " !\"#$%&;=@[\\]^_`{|}~§"
    )
    static var paymentSymbolsForeign = CharacterSet(charactersIn: " ")

    static var paymentSymbolsSpecial = CharacterSet(
        charactersIn: "'()+,-./:?"
    )

    static var domesticPaymentAllowed: CharacterSet = [
        paymentDigits, paymentAlphaLowercase, paymentAlphaUppercase,
        paymentDiacritics,
        paymentSymbolsSpecial, paymentSymbolsDomestic
    ].reduce(CharacterSet()) { $0.union($1) }

    static var foreignPaymentAllowed: CharacterSet = [
        paymentDigits, paymentAlphaLowercase, paymentAlphaUppercase,
        paymentSymbolsSpecial, paymentSymbolsForeign
    ].reduce(CharacterSet()) { $0.union($1) }
}

extension String {
    func charactersNotIn(_ validCharacters: CharacterSet) -> String {
        let invalidCharacters = self.unicodeScalars.filter { !validCharacters.contains($0) }
        let uniqueInvalidCharacters = Set(invalidCharacters)

        return uniqueInvalidCharacters.map { String($0) }.joined(separator: "")
    }
}
