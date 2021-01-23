//
//  Bundle+Info.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 06/03/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension Bundle {
    var displayName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    var shortVersion: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
    }
    var buildNumber: String {
        return infoDictionary?[kCFBundleVersionKey as String] as? String ?? "0"
    }
    var hockeyAppId: String? {
        return infoDictionary?["HockeyAppId"] as? String
    }
    var smartKeySDKAppBadge: String? {
        return infoDictionary?["CMAppBadge"] as? String
    }
    var releaseNotes: String? {
        return object(forInfoDictionaryKey: "Release Notes") as? String
    }
}
