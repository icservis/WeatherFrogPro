//
//  Locale+CSOB.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 26/07/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation
extension Locale {
    private(set) static var contraLocale: Locale = Locale.current.languageCode == "cs" ?
        Locale(identifier: "en_US") :
        Locale(identifier: "cs_CZ")
    private(set) static var csobCurrent: Locale = Locale.current.languageCode == "cs" ?
        Locale.current :
        Locale(identifier: "en_US")

    static let posix = Locale(identifier: "en_US_POSIX")

    func url(forResource name: String?, withExtension ext: String?) -> URL? {
        if let url = bundle?.url(forResource: name, withExtension: ext) {
            return url
        } else {
            return Locale.baseBundle.url(forResource: name, withExtension: ext)
        }
    }

    private var bundle: Bundle? {
        if let language = languageCode,
           let bundle = Locale.bundle(for: language) {
            return bundle
        }
        return nil
    }

    static var baseBundle: Bundle {
        return bundle(for: "Base") ?? Bundle.main
    }

    static func bundle(for language: String) -> Bundle? {
        guard
            let path = Bundle.main.path(forResource: language, ofType: "lproj"),
            let bundle = Bundle(path: path) else { return Bundle.main }
        return bundle
    }
}
