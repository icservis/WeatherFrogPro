// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif

// swiftlint:disable file_length line_length

// swiftlint:disable type_body_length
enum Asset: String {
  case removeTag = "removeTag"
  case navbarLogo = "navbar_logo"
  case icRefresh = "ic_refresh"
  case numericKeyboard = "numericKeyboard"
  case menuBlue = "menu_blue"
  case dateKeyboard = "dateKeyboard"
  case menuWhite = "menu_white"
  case g01AImage = "G01AImage"
  case g02Image = "G02Image"
  case visa = "visa"
  case mastercard = "mastercard"
  case notifyIcon = "NotifyIcon"
  case rub = "rub"
  case gbp = "gbp"
  case usd = "usd"
  case huf = "huf"
  case hrk = "hrk"
  case `try` = "try"
  case pln = "pln"
  case cny = "cny"
  case eur = "eur"
  case nok = "nok"
  case cad = "cad"
  case chf = "chf"
  case aud = "aud"
  case dkk = "dkk"
  case jpy = "jpy"
  case ron = "ron"
  case sek = "sek"
  case logo = "logo"
  case filter = "filter"
  case listKeyboard = "listKeyboard"
  case phoneIcon = "PHONE_ICON"
  case appstoreIcon = "APPSTORE_ICON"
  case emailIcon = "EMAIL_ICON"
  case webIcon = "WEB_ICON"
  case lock = "lock"
  case close = "close"
  case anchor = "anchor"
  case icCreditCard = "ic_credit_card"
  case external = "external"
  case smallGrayDisclosureIndicator = "small-gray-disclosureIndicator"
  case smallBlueDisclosureIndicator = "small-blue-disclosureIndicator"
  case verticalDisclosure = "vertical_disclosure"
  case disclosureIndicator = "disclosureIndicator"
  case exit = "exit"
  case holdTransaction = "holdTransaction"
  case rejectedTransaction = "rejectedTransaction"
  case waitingTransaction = "waitingTransaction"
  case priorityMsgIndicatorWhite = "priorityMsgIndicatorWhite"
  case priorityMsgIndicator = "priorityMsgIndicator"
  case unreadMsgIndicator = "unreadMsgIndicator"
  case icArrowForward = "ic_arrow_forward"
  case hourglass = "hourglass"
  case sort = "sort"
  case downNativeArrow = "downNativeArrow"
  case upArrow = "up-arrow"
  case downArrow = "down-arrow"
  case rightArrow = "right-arrow"
  case upNativeArrow = "upNativeArrow"
  case help = "help"
  case settings = "settings"
  case icInbox = "ic_inbox"
  case _2Flash = "2-flash"
  case _3Time = "3-time"
  case _1Tag = "1-tag"
  case _4Phone = "4-phone"
  case icAssignment = "ic_assignment"
  case miniDashboardLocations = "miniDashboardLocations"
  case miniDashboardAwaitingPayments = "miniDashboardAwaitingPayments"
  case miniDashboardWaitingRoom = "miniDashboardWaitingRoom"
  case miniDashboardRefusedPayments = "miniDashboardRefusedPayments"
  case group2 = "group2"
  case logoWhite = "logo_white"
  case inbox = "inbox"
  case userGroup = "user-group"

  var image: Image {
    let bundle = Bundle(for: AssetBundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: rawValue)
    #elseif os(watchOS)
    let image = Image(named: rawValue)
    #endif
    guard let result = image else { fatalError("Unable to load image \(rawValue).") }
    return result
  }
}
// swiftlint:enable type_body_length

extension Image {
  convenience init!(asset: Asset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: AssetBundleToken.self)
    self.init(named: asset.rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX) || os(watchOS)
    self.init(named: asset.rawValue)
    #endif
  }
}

private final class AssetBundleToken {}
