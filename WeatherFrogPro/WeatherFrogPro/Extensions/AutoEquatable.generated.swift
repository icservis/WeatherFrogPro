// Generated using Sourcery 0.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
internal func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)
    case (nil, nil):
        return true
    default:
        return false
    }
}

internal func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}

// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - ABO AutoEquatable
extension ABO: Equatable {} 
internal func == (lhs: ABO, rhs: ABO) -> Bool {
	guard
     compareOptionals(lhs: lhs.prefix, rhs: rhs.prefix, compare: ==), 
     compareOptionals(lhs: lhs.number, rhs: rhs.number, compare: ==), 
     compareOptionals(lhs: lhs.bank, rhs: rhs.bank, compare: ==)
    else { return false }
    return true
}
// MARK: - AccountDetail AutoEquatable
extension AccountDetail: Equatable {} 
internal func == (lhs: AccountDetail, rhs: AccountDetail) -> Bool {
	guard
     lhs.mainAction == rhs.mainAction, 
     compareOptionals(lhs: lhs.mainActionToDisplay, rhs: rhs.mainActionToDisplay, compare: ==), 
     lhs.showCards == rhs.showCards, 
     lhs.showStandingOrders == rhs.showStandingOrders, 
     compareOptionals(lhs: lhs.leftPair, rhs: rhs.leftPair, compare: ==), 
     compareOptionals(lhs: lhs.rightPair, rhs: rhs.rightPair, compare: ==), 
     compareOptionals(lhs: lhs.bannerPair, rhs: rhs.bannerPair, compare: ==), 
     lhs.properties == rhs.properties
    else { return false }
    return true
}
// MARK: - Contact AutoEquatable
extension Contact: Equatable {} 
internal func == (lhs: Contact, rhs: Contact) -> Bool {
	guard
     lhs.type == rhs.type, 
     lhs.value == rhs.value, 
     lhs.label == rhs.label, 
     compareOptionals(lhs: lhs.icon, rhs: rhs.icon, compare: ==)
    else { return false }
    return true
}
// MARK: - ContactSection AutoEquatable
extension ContactSection: Equatable {} 
internal func == (lhs: ContactSection, rhs: ContactSection) -> Bool {
	guard
     lhs.title == rhs.title, 
     lhs.count == rhs.count, 
     lhs.items == rhs.items
    else { return false }
    return true
}
// MARK: - ContactsList AutoEquatable
extension ContactsList: Equatable {} 
internal func == (lhs: ContactsList, rhs: ContactsList) -> Bool {
	guard
     lhs.sections == rhs.sections
    else { return false }
    return true
}
// MARK: - Contract AutoEquatable
extension Contract: Equatable {} 
internal func == (lhs: Contract, rhs: Contract) -> Bool {
	guard
     lhs.id == rhs.id, 
     lhs.isActive == rhs.isActive, 
     lhs.isDisabled == rhs.isDisabled, 
     lhs.isUserActive == rhs.isUserActive, 
     lhs.name == rhs.name, 
     lhs.companyName == rhs.companyName, 
     lhs.authMethods == rhs.authMethods, 
     lhs.bannedChannels == rhs.bannedChannels
    else { return false }
    return true
}
// MARK: - CstEnum AutoEquatable
extension CstEnum: Equatable {} 
internal func == (lhs: CstEnum, rhs: CstEnum) -> Bool {
	guard
     lhs.cst == rhs.cst, 
     lhs.text == rhs.text, 
     lhs.id == rhs.id, 
     compareOptionals(lhs: lhs.code, rhs: rhs.code, compare: ==)
    else { return false }
    return true
}
// MARK: - CstEnumPack AutoEquatable
extension CstEnumPack: Equatable {} 
internal func == (lhs: CstEnumPack, rhs: CstEnumPack) -> Bool {
	guard
     lhs.enumValues == rhs.enumValues
    else { return false }
    return true
}
// MARK: - CstEnumValues AutoEquatable
extension CstEnumValues: Equatable {} 
internal func == (lhs: CstEnumValues, rhs: CstEnumValues) -> Bool {
	guard
     lhs.list == rhs.list
    else { return false }
    return true
}
// MARK: - ExRate AutoEquatable
extension ExRate: Equatable {} 
internal func == (lhs: ExRate, rhs: ExRate) -> Bool {
	guard
     compareOptionals(lhs: lhs.cashLessMid, rhs: rhs.cashLessMid, compare: ==), 
     compareOptionals(lhs: lhs.cashLessPurchase, rhs: rhs.cashLessPurchase, compare: ==), 
     compareOptionals(lhs: lhs.cashLessSale, rhs: rhs.cashLessSale, compare: ==), 
     compareOptionals(lhs: lhs.cashMid, rhs: rhs.cashMid, compare: ==), 
     compareOptionals(lhs: lhs.cashPurchase, rhs: rhs.cashPurchase, compare: ==), 
     compareOptionals(lhs: lhs.cashSale, rhs: rhs.cashSale, compare: ==), 
     lhs.currency == rhs.currency, 
     compareOptionals(lhs: lhs.flag, rhs: rhs.flag, compare: ==), 
     compareOptionals(lhs: lhs.quantity, rhs: rhs.quantity, compare: ==), 
     lhs.kind == rhs.kind
    else { return false }
    return true
}
// MARK: - Help AutoEquatable
extension Help: Equatable {} 
internal func == (lhs: Help, rhs: Help) -> Bool {
	guard
     lhs.id == rhs.id, 
     lhs.question == rhs.question, 
     lhs.answer == rhs.answer, 
     lhs.ord == rhs.ord, 
     compareOptionals(lhs: lhs.categories, rhs: rhs.categories, compare: ==), 
     compareOptionals(lhs: lhs.relevantQuestions, rhs: rhs.relevantQuestions, compare: ==), 
     compareOptionals(lhs: lhs.contacts, rhs: rhs.contacts, compare: ==), 
     compareOptionals(lhs: lhs.searchedText, rhs: rhs.searchedText, compare: ==)
    else { return false }
    return true
}
// MARK: - Help.Category AutoEquatable
extension Help.Category: Equatable {} 
internal func == (lhs: Help.Category, rhs: Help.Category) -> Bool {
	guard
     lhs.id == rhs.id, 
     compareOptionals(lhs: lhs.category, rhs: rhs.category, compare: ==)
    else { return false }
    return true
}
// MARK: - Help.RelevantQuestion AutoEquatable
extension Help.RelevantQuestion: Equatable {} 
internal func == (lhs: Help.RelevantQuestion, rhs: Help.RelevantQuestion) -> Bool {
	guard
     lhs.id == rhs.id, 
     compareOptionals(lhs: lhs.help, rhs: rhs.help, compare: ==)
    else { return false }
    return true
}
// MARK: - HelpCategory AutoEquatable
extension HelpCategory: Equatable {} 
internal func == (lhs: HelpCategory, rhs: HelpCategory) -> Bool {
	guard
     lhs.id == rhs.id, 
     lhs.ord == rhs.ord, 
     lhs.name == rhs.name
    else { return false }
    return true
}
// MARK: - HelpList AutoEquatable
extension HelpList: Equatable {} 
internal func == (lhs: HelpList, rhs: HelpList) -> Bool {
	guard
     lhs.questions == rhs.questions, 
     lhs.categories == rhs.categories
    else { return false }
    return true
}
// MARK: - IBAN AutoEquatable
extension IBAN: Equatable {} 
internal func == (lhs: IBAN, rhs: IBAN) -> Bool {
	guard
     compareOptionals(lhs: lhs.code, rhs: rhs.code, compare: ==)
    else { return false }
    return true
}
// MARK: - IBAN.Definition AutoEquatable
extension IBAN.Definition: Equatable {} 
internal func == (lhs: IBAN.Definition, rhs: IBAN.Definition) -> Bool {
	guard
     lhs.countryCode == rhs.countryCode, 
     lhs.length == rhs.length, 
     lhs.sepa == rhs.sepa, 
     compareOptionals(lhs: lhs.checkSum, rhs: rhs.checkSum, compare: ==)
    else { return false }
    return true
}
// MARK: - KeyValueGroup AutoEquatable
extension KeyValueGroup: Equatable {} 
internal func == (lhs: KeyValueGroup, rhs: KeyValueGroup) -> Bool {
	guard
     compareOptionals(lhs: lhs.code, rhs: rhs.code, compare: ==), 
     lhs.type == rhs.type, 
     lhs.pairs == rhs.pairs
    else { return false }
    return true
}
// MARK: - KeyValuePair AutoEquatable
extension KeyValuePair: Equatable {} 
internal func == (lhs: KeyValuePair, rhs: KeyValuePair) -> Bool {
	guard
     compareOptionals(lhs: lhs.name, rhs: rhs.name, compare: ==), 
     compareOptionals(lhs: lhs.key, rhs: rhs.key, compare: ==), 
     compareOptionals(lhs: lhs.value, rhs: rhs.value, compare: ==), 
     compareOptionals(lhs: lhs.type, rhs: rhs.type, compare: ==), 
     compareOptionals(lhs: lhs.color, rhs: rhs.color, compare: ==), 
     compareOptionals(lhs: lhs.weight, rhs: rhs.weight, compare: ==), 
     compareOptionals(lhs: lhs.size, rhs: rhs.size, compare: ==), 
     compareOptionals(lhs: lhs.flags, rhs: rhs.flags, compare: ==), 
     compareOptionals(lhs: lhs.icon, rhs: rhs.icon, compare: ==), 
     compareOptionals(lhs: lhs.deeplink, rhs: rhs.deeplink, compare: ==)
    else { return false }
    return true
}
// MARK: - MenuItem AutoEquatable
extension MenuItem: Equatable {} 
internal func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
	guard
     lhs.name == rhs.name, 
     compareOptionals(lhs: lhs.icon, rhs: rhs.icon, compare: ==), 
     lhs.destination == rhs.destination, 
     lhs.style == rhs.style, 
     compareOptionals(lhs: lhs.badge, rhs: rhs.badge, compare: ==), 
     lhs.isExternal == rhs.isExternal
    else { return false }
    return true
}
// MARK: - News AutoEquatable
extension News: Equatable {} 
internal func == (lhs: News, rhs: News) -> Bool {
	guard
     lhs.caption == rhs.caption, 
     lhs.htmlBody == rhs.htmlBody, 
     lhs.id == rhs.id, 
     lhs.priority == rhs.priority, 
     lhs.wasRead == rhs.wasRead, 
     lhs.title == rhs.title, 
     compareOptionals(lhs: lhs.validFrom, rhs: rhs.validFrom, compare: ==), 
     compareOptionals(lhs: lhs.validTo, rhs: rhs.validTo, compare: ==)
    else { return false }
    return true
}
// MARK: - NewsList AutoEquatable
extension NewsList: Equatable {} 
internal func == (lhs: NewsList, rhs: NewsList) -> Bool {
	guard
     lhs.list == rhs.list
    else { return false }
    return true
}
// MARK: - PagingInfo AutoEquatable
extension PagingInfo: Equatable {} 
internal func == (lhs: PagingInfo, rhs: PagingInfo) -> Bool {
	guard
     lhs.count == rhs.count, 
     lhs.current == rhs.current, 
     lhs.dataCount == rhs.dataCount
    else { return false }
    return true
}
// MARK: - Payment AutoEquatable
extension Payment: Equatable {} 
internal func == (lhs: Payment, rhs: Payment) -> Bool {
	guard
     lhs.scope == rhs.scope, 
     lhs.accPayer == rhs.accPayer, 
     lhs.accPayee == rhs.accPayee, 
     lhs.accMyOwn == rhs.accMyOwn, 
     lhs.amount == rhs.amount, 
     lhs.msgPayee == rhs.msgPayee, 
     lhs.noteToSelf == rhs.noteToSelf, 
     lhs.purpose == rhs.purpose, 
     lhs.valueDate == rhs.valueDate, 
     lhs.varSymbol == rhs.varSymbol, 
     lhs.conSymbol == rhs.conSymbol, 
     lhs.specSymbol == rhs.specSymbol, 
     lhs.priorityFlag == rhs.priorityFlag, 
     lhs.forceInstructionInt == rhs.forceInstructionInt, 
     lhs.instructionInt == rhs.instructionInt, 
     lhs.missingSwift == rhs.missingSwift, 
     lhs.swiftBic == rhs.swiftBic, 
     lhs.automaticProcessing == rhs.automaticProcessing, 
     lhs.purposeInt == rhs.purposeInt, 
     lhs.feesInt == rhs.feesInt, 
     lhs.addressBankInt == rhs.addressBankInt, 
     lhs.referencePayer == rhs.referencePayer, 
     lhs.counterpartyInt == rhs.counterpartyInt, 
     lhs.identSepa == rhs.identSepa, 
     lhs.counterpartySepa == rhs.counterpartySepa, 
     lhs.ultimateCreditor == rhs.ultimateCreditor, 
     lhs.ultimateDebtor == rhs.ultimateDebtor
    else { return false }
    return true
}
// MARK: - Payment.AccMyOwn AutoEquatable
extension Payment.AccMyOwn: Equatable {} 
internal func == (lhs: Payment.AccMyOwn, rhs: Payment.AccMyOwn) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     compareOptionals(lhs: lhs.account, rhs: rhs.account, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.AccPayee AutoEquatable
extension Payment.AccPayee: Equatable {} 
internal func == (lhs: Payment.AccPayee, rhs: Payment.AccPayee) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     compareOptionals(lhs: lhs.abo, rhs: rhs.abo, compare: ==), 
     compareOptionals(lhs: lhs.iban, rhs: rhs.iban, compare: ==), 
     compareOptionals(lhs: lhs.account, rhs: rhs.account, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.AccPayer AutoEquatable
extension Payment.AccPayer: Equatable {} 
internal func == (lhs: Payment.AccPayer, rhs: Payment.AccPayer) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     compareOptionals(lhs: lhs.account, rhs: rhs.account, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.AddressBankInt AutoEquatable
extension Payment.AddressBankInt: Equatable {} 
internal func == (lhs: Payment.AddressBankInt, rhs: Payment.AddressBankInt) -> Bool {
	guard
     lhs.bankName1 == rhs.bankName1, 
     compareOptionals(lhs: lhs.bankName1Error, rhs: rhs.bankName1Error, compare: ==), 
     lhs.bankName2 == rhs.bankName2, 
     compareOptionals(lhs: lhs.bankName2Error, rhs: rhs.bankName2Error, compare: ==), 
     lhs.bankAddress1 == rhs.bankAddress1, 
     compareOptionals(lhs: lhs.bankAddress1Error, rhs: rhs.bankAddress1Error, compare: ==), 
     lhs.bankAddress2 == rhs.bankAddress2, 
     compareOptionals(lhs: lhs.bankAddress2Error, rhs: rhs.bankAddress2Error, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.Amount AutoEquatable
extension Payment.Amount: Equatable {} 
internal func == (lhs: Payment.Amount, rhs: Payment.Amount) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     compareOptionals(lhs: lhs.value, rhs: rhs.value, compare: ==), 
     compareOptionals(lhs: lhs.currency, rhs: rhs.currency, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.AutomaticProcessing AutoEquatable
extension Payment.AutomaticProcessing: Equatable {} 
internal func == (lhs: Payment.AutomaticProcessing, rhs: Payment.AutomaticProcessing) -> Bool {
	guard
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.ConSymbol AutoEquatable
extension Payment.ConSymbol: Equatable {} 
internal func == (lhs: Payment.ConSymbol, rhs: Payment.ConSymbol) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.CounterpartyInt AutoEquatable
extension Payment.CounterpartyInt: Equatable {} 
internal func == (lhs: Payment.CounterpartyInt, rhs: Payment.CounterpartyInt) -> Bool {
	guard
     lhs.name1 == rhs.name1, 
     compareOptionals(lhs: lhs.name1Error, rhs: rhs.name1Error, compare: ==), 
     lhs.name2 == rhs.name2, 
     compareOptionals(lhs: lhs.name2Error, rhs: rhs.name2Error, compare: ==), 
     lhs.address1 == rhs.address1, 
     compareOptionals(lhs: lhs.address1Error, rhs: rhs.address1Error, compare: ==), 
     lhs.address2 == rhs.address2, 
     compareOptionals(lhs: lhs.address2Error, rhs: rhs.address2Error, compare: ==), 
     lhs.countryCode == rhs.countryCode, 
     compareOptionals(lhs: lhs.countryCodeError, rhs: rhs.countryCodeError, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.CounterpartySepa AutoEquatable
extension Payment.CounterpartySepa: Equatable {} 
internal func == (lhs: Payment.CounterpartySepa, rhs: Payment.CounterpartySepa) -> Bool {
	guard
     lhs.name == rhs.name, 
     compareOptionals(lhs: lhs.nameError, rhs: rhs.nameError, compare: ==), 
     lhs.address1 == rhs.address1, 
     compareOptionals(lhs: lhs.address1Error, rhs: rhs.address1Error, compare: ==), 
     lhs.address2 == rhs.address2, 
     compareOptionals(lhs: lhs.address2Error, rhs: rhs.address2Error, compare: ==), 
     lhs.countryCode == rhs.countryCode, 
     compareOptionals(lhs: lhs.countryCodeError, rhs: rhs.countryCodeError, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.ExRate AutoEquatable
extension Payment.ExRate: Equatable {} 
internal func == (lhs: Payment.ExRate, rhs: Payment.ExRate) -> Bool {
	guard
     lhs.currencyCode == rhs.currencyCode, 
     lhs.purchase == rhs.purchase, 
     lhs.quantity == rhs.quantity, 
     lhs.sale == rhs.sale
    else { return false }
    return true
}
// MARK: - Payment.FeesInt AutoEquatable
extension Payment.FeesInt: Equatable {} 
internal func == (lhs: Payment.FeesInt, rhs: Payment.FeesInt) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value, 
     lhs.fixed == rhs.fixed
    else { return false }
    return true
}
// MARK: - Payment.ForceInstructionInt AutoEquatable
extension Payment.ForceInstructionInt: Equatable {} 
internal func == (lhs: Payment.ForceInstructionInt, rhs: Payment.ForceInstructionInt) -> Bool {
	guard
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.IdentSepa AutoEquatable
extension Payment.IdentSepa: Equatable {} 
internal func == (lhs: Payment.IdentSepa, rhs: Payment.IdentSepa) -> Bool {
	guard
     lhs.value == rhs.value, 
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.InstructionInt AutoEquatable
extension Payment.InstructionInt: Equatable {} 
internal func == (lhs: Payment.InstructionInt, rhs: Payment.InstructionInt) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.MissingSwift AutoEquatable
extension Payment.MissingSwift: Equatable {} 
internal func == (lhs: Payment.MissingSwift, rhs: Payment.MissingSwift) -> Bool {
	guard
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.MsgPayee AutoEquatable
extension Payment.MsgPayee: Equatable {} 
internal func == (lhs: Payment.MsgPayee, rhs: Payment.MsgPayee) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.NoteToSelf AutoEquatable
extension Payment.NoteToSelf: Equatable {} 
internal func == (lhs: Payment.NoteToSelf, rhs: Payment.NoteToSelf) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.PriorityFlag AutoEquatable
extension Payment.PriorityFlag: Equatable {} 
internal func == (lhs: Payment.PriorityFlag, rhs: Payment.PriorityFlag) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.Purpose AutoEquatable
extension Payment.Purpose: Equatable {} 
internal func == (lhs: Payment.Purpose, rhs: Payment.Purpose) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.PurposeInt AutoEquatable
extension Payment.PurposeInt: Equatable {} 
internal func == (lhs: Payment.PurposeInt, rhs: Payment.PurposeInt) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.ReferencePayer AutoEquatable
extension Payment.ReferencePayer: Equatable {} 
internal func == (lhs: Payment.ReferencePayer, rhs: Payment.ReferencePayer) -> Bool {
	guard
     lhs.value == rhs.value, 
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.SpecSymbol AutoEquatable
extension Payment.SpecSymbol: Equatable {} 
internal func == (lhs: Payment.SpecSymbol, rhs: Payment.SpecSymbol) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.SwiftBic AutoEquatable
extension Payment.SwiftBic: Equatable {} 
internal func == (lhs: Payment.SwiftBic, rhs: Payment.SwiftBic) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - Payment.UltimateCreditor AutoEquatable
extension Payment.UltimateCreditor: Equatable {} 
internal func == (lhs: Payment.UltimateCreditor, rhs: Payment.UltimateCreditor) -> Bool {
	guard
     lhs.value == rhs.value, 
     compareOptionals(lhs: lhs.valueError, rhs: rhs.valueError, compare: ==), 
     lhs.info == rhs.info, 
     compareOptionals(lhs: lhs.infoError, rhs: rhs.infoError, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.UltimateDebtor AutoEquatable
extension Payment.UltimateDebtor: Equatable {} 
internal func == (lhs: Payment.UltimateDebtor, rhs: Payment.UltimateDebtor) -> Bool {
	guard
     lhs.value == rhs.value, 
     compareOptionals(lhs: lhs.valueError, rhs: rhs.valueError, compare: ==), 
     lhs.info == rhs.info, 
     compareOptionals(lhs: lhs.infoError, rhs: rhs.infoError, compare: ==)
    else { return false }
    return true
}
// MARK: - Payment.ValueDate AutoEquatable
extension Payment.ValueDate: Equatable {} 
internal func == (lhs: Payment.ValueDate, rhs: Payment.ValueDate) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     compareOptionals(lhs: lhs.date, rhs: rhs.date, compare: ==), 
     lhs.fixed == rhs.fixed, 
     lhs.fixedMessage == rhs.fixedMessage
    else { return false }
    return true
}
// MARK: - Payment.VarSymbol AutoEquatable
extension Payment.VarSymbol: Equatable {} 
internal func == (lhs: Payment.VarSymbol, rhs: Payment.VarSymbol) -> Bool {
	guard
     compareOptionals(lhs: lhs.error, rhs: rhs.error, compare: ==), 
     lhs.value == rhs.value
    else { return false }
    return true
}
// MARK: - PaymentAuthorizationResult AutoEquatable
extension PaymentAuthorizationResult: Equatable {} 
internal func == (lhs: PaymentAuthorizationResult, rhs: PaymentAuthorizationResult) -> Bool {
	guard
     lhs.authSuccessful == rhs.authSuccessful, 
     lhs.authorizationResultCode == rhs.authorizationResultCode, 
     compareOptionals(lhs: lhs.waitingRoomItem, rhs: rhs.waitingRoomItem, compare: ==), 
     compareOptionals(lhs: lhs.errorAction, rhs: rhs.errorAction, compare: ==), 
     compareOptionals(lhs: lhs.authorizationSetId, rhs: rhs.authorizationSetId, compare: ==), 
     compareOptionals(lhs: lhs.signingId, rhs: rhs.signingId, compare: ==), 
     compareOptionals(lhs: lhs.partyAccount, rhs: rhs.partyAccount, compare: ==), 
     compareOptionals(lhs: lhs.amountAndCurrency, rhs: rhs.amountAndCurrency, compare: ==)
    else { return false }
    return true
}
// MARK: - PaymentTransactionCreateResult AutoEquatable
extension PaymentTransactionCreateResult: Equatable {} 
internal func == (lhs: PaymentTransactionCreateResult, rhs: PaymentTransactionCreateResult) -> Bool {
	guard
     compareOptionals(lhs: lhs.paymentMethodId, rhs: rhs.paymentMethodId, compare: ==), 
     compareOptionals(lhs: lhs.traceId, rhs: rhs.traceId, compare: ==), 
     compareOptionals(lhs: lhs.waitingRoomItem, rhs: rhs.waitingRoomItem, compare: ==)
    else { return false }
    return true
}
// MARK: - PaymentValidationErrors AutoEquatable
extension PaymentValidationErrors: Equatable {} 
internal func == (lhs: PaymentValidationErrors, rhs: PaymentValidationErrors) -> Bool {
	guard
     lhs.global == rhs.global, 
     compareOptionals(lhs: lhs.elements, rhs: rhs.elements, compare: ==)
    else { return false }
    return true
}
// MARK: - PaymentValidationErrors.Element AutoEquatable
extension PaymentValidationErrors.Element: Equatable {} 
internal func == (lhs: PaymentValidationErrors.Element, rhs: PaymentValidationErrors.Element) -> Bool {
	guard
     lhs.identifier == rhs.identifier, 
     lhs.error == rhs.error
    else { return false }
    return true
}
// MARK: - PaymentValidationErrors.Error AutoEquatable
extension PaymentValidationErrors.Error: Equatable {} 
internal func == (lhs: PaymentValidationErrors.Error, rhs: PaymentValidationErrors.Error) -> Bool {
	guard
     lhs.message == rhs.message, 
     compareOptionals(lhs: lhs.placeholder, rhs: rhs.placeholder, compare: ==)
    else { return false }
    return true
}
// MARK: - PaymentValidationModel AutoEquatable
extension PaymentValidationModel: Equatable {} 
internal func == (lhs: PaymentValidationModel, rhs: PaymentValidationModel) -> Bool {
	guard
     lhs.actualBankingDate == rhs.actualBankingDate, 
     lhs.nextBankingDate == rhs.nextBankingDate, 
     lhs.nonBankingDays == rhs.nonBankingDays, 
     lhs.exRates == rhs.exRates, 
     lhs.availableCurrencies == rhs.availableCurrencies, 
     lhs.paymentTypes == rhs.paymentTypes
    else { return false }
    return true
}
// MARK: - PaymentValidationModel.Cot AutoEquatable
extension PaymentValidationModel.Cot: Equatable {} 
internal func == (lhs: PaymentValidationModel.Cot, rhs: PaymentValidationModel.Cot) -> Bool {
	guard
     lhs.cot == rhs.cot, 
     lhs.time == rhs.time
    else { return false }
    return true
}
// MARK: - PaymentValidationModel.PaymentType AutoEquatable
extension PaymentValidationModel.PaymentType: Equatable {} 
internal func == (lhs: PaymentValidationModel.PaymentType, rhs: PaymentValidationModel.PaymentType) -> Bool {
	guard
     lhs.identifier == rhs.identifier, 
     lhs.maxPaymentDate == rhs.maxPaymentDate, 
     compareOptionals(lhs: lhs.amountLimit, rhs: rhs.amountLimit, compare: ==), 
     compareOptionals(lhs: lhs.amountLimitCurrencyCode, rhs: rhs.amountLimitCurrencyCode, compare: ==), 
     compareOptionals(lhs: lhs.availableCurrencies, rhs: rhs.availableCurrencies, compare: ==), 
     lhs.cots == rhs.cots
    else { return false }
    return true
}
// MARK: - SessionAuth AutoEquatable
extension SessionAuth: Equatable {} 
internal func == (lhs: SessionAuth, rhs: SessionAuth) -> Bool {
	guard
     lhs.token == rhs.token, 
     compareOptionals(lhs: lhs.oli, rhs: rhs.oli, compare: ==), 
     compareOptionals(lhs: lhs.clientThreadId, rhs: rhs.clientThreadId, compare: ==)
    else { return false }
    return true
}
// MARK: - SessionInfo AutoEquatable
extension SessionInfo: Equatable {} 
internal func == (lhs: SessionInfo, rhs: SessionInfo) -> Bool {
	guard
     lhs.userName == rhs.userName, 
     compareOptionals(lhs: lhs.contractID, rhs: rhs.contractID, compare: ==), 
     compareOptionals(lhs: lhs.contractName, rhs: rhs.contractName, compare: ==)
    else { return false }
    return true
}
// MARK: - TokenInfo AutoEquatable
extension TokenInfo: Equatable {} 
internal func == (lhs: TokenInfo, rhs: TokenInfo) -> Bool {
	guard
     lhs.oli == rhs.oli
    else { return false }
    return true
}
// MARK: - Transaction AutoEquatable
extension Transaction: Equatable {} 
internal func == (lhs: Transaction, rhs: Transaction) -> Bool {
	guard
     lhs.transactionDate == rhs.transactionDate, 
     compareOptionals(lhs: lhs.previewDetail, rhs: rhs.previewDetail, compare: ==), 
     compareOptionals(lhs: lhs.fullDetail, rhs: rhs.fullDetail, compare: ==)
    else { return false }
    return true
}
// MARK: - Transaction.Detail AutoEquatable
extension Transaction.Detail: Equatable {} 
internal func == (lhs: Transaction.Detail, rhs: Transaction.Detail) -> Bool {
	guard
     compareOptionals(lhs: lhs.titlePair, rhs: rhs.titlePair, compare: ==), 
     compareOptionals(lhs: lhs.header, rhs: rhs.header, compare: ==), 
     compareOptionals(lhs: lhs.headlineLeft, rhs: rhs.headlineLeft, compare: ==), 
     compareOptionals(lhs: lhs.headlineRight, rhs: rhs.headlineRight, compare: ==), 
     compareOptionals(lhs: lhs.section, rhs: rhs.section, compare: ==), 
     compareOptionals(lhs: lhs.condensed, rhs: rhs.condensed, compare: ==), 
     compareOptionals(lhs: lhs.footer, rhs: rhs.footer, compare: ==), 
     compareOptionals(lhs: lhs.status, rhs: rhs.status, compare: ==)
    else { return false }
    return true
}
// MARK: - Transaction.SortableKey AutoEquatable
extension Transaction.SortableKey: Equatable {} 
internal func == (lhs: Transaction.SortableKey, rhs: Transaction.SortableKey) -> Bool {
	guard
     lhs.value == rhs.value, 
     lhs.sortOrder == rhs.sortOrder
    else { return false }
    return true
}
// MARK: - TransactionDay AutoEquatable
extension TransactionDay: Equatable {} 
internal func == (lhs: TransactionDay, rhs: TransactionDay) -> Bool {
	guard
     lhs.day == rhs.day, 
     lhs.transactions == rhs.transactions
    else { return false }
    return true
}
// MARK: - TransactionList AutoEquatable
extension TransactionList: Equatable {} 
internal func == (lhs: TransactionList, rhs: TransactionList) -> Bool {
	guard
     compareOptionals(lhs: lhs.headers, rhs: rhs.headers, compare: ==), 
     lhs.transactions == rhs.transactions, 
     lhs.pagingInfo == rhs.pagingInfo
    else { return false }
    return true
}
// MARK: - TransactionList.Headers AutoEquatable
extension TransactionList.Headers: Equatable {} 
internal func == (lhs: TransactionList.Headers, rhs: TransactionList.Headers) -> Bool {
	guard
     compareOptionals(lhs: lhs.title, rhs: rhs.title, compare: ==), 
     compareOptionals(lhs: lhs.header, rhs: rhs.header, compare: ==), 
     compareOptionals(lhs: lhs.subheader, rhs: rhs.subheader, compare: ==)
    else { return false }
    return true
}
// MARK: - TransactionList.Headers.Subheader AutoEquatable
extension TransactionList.Headers.Subheader: Equatable {} 
internal func == (lhs: TransactionList.Headers.Subheader, rhs: TransactionList.Headers.Subheader) -> Bool {
	guard
     compareOptionals(lhs: lhs.left, rhs: rhs.left, compare: ==), 
     compareOptionals(lhs: lhs.right, rhs: rhs.right, compare: ==), 
     compareOptionals(lhs: lhs.center, rhs: rhs.center, compare: ==)
    else { return false }
    return true
}
// MARK: - TransactionsPresent AutoEquatable
extension TransactionsPresent: Equatable {} 
internal func == (lhs: TransactionsPresent, rhs: TransactionsPresent) -> Bool {
	guard
     lhs.present == rhs.present, 
     compareOptionals(lhs: lhs.headers, rhs: rhs.headers, compare: ==)
    else { return false }
    return true
}
// MARK: - TransactionsSummary AutoEquatable
extension TransactionsSummary: Equatable {} 
internal func == (lhs: TransactionsSummary, rhs: TransactionsSummary) -> Bool {
	guard
     compareOptionals(lhs: lhs.headers, rhs: rhs.headers, compare: ==)
    else { return false }
    return true
}
// MARK: - Tutorial AutoEquatable
extension Tutorial: Equatable {} 
internal func == (lhs: Tutorial, rhs: Tutorial) -> Bool {
	guard
     lhs.pages == rhs.pages
    else { return false }
    return true
}
// MARK: - TutorialPage AutoEquatable
extension TutorialPage: Equatable {} 
internal func == (lhs: TutorialPage, rhs: TutorialPage) -> Bool {
	guard
     lhs.page == rhs.page, 
     compareOptionals(lhs: lhs.image, rhs: rhs.image, compare: ==), 
     lhs.title == rhs.title, 
     lhs.text == rhs.text, 
     lhs.buttonCaption == rhs.buttonCaption
    else { return false }
    return true
}
// MARK: - TutorialPageProtocol AutoEquatable
internal func == (lhs: TutorialPageProtocol, rhs: TutorialPageProtocol) -> Bool {
	guard
     lhs.page == rhs.page, 
     compareOptionals(lhs: lhs.image, rhs: rhs.image, compare: ==), 
     lhs.title == rhs.title, 
     lhs.text == rhs.text, 
     lhs.buttonCaption == rhs.buttonCaption
    else { return false }
    return true
}
// MARK: - UserInfo AutoEquatable
extension UserInfo: Equatable {} 
internal func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
	guard
     lhs.firstName == rhs.firstName, 
     lhs.lastName == rhs.lastName
    else { return false }
    return true
}
// MARK: - WaitingRoomItem AutoEquatable
extension WaitingRoomItem: Equatable {} 
internal func == (lhs: WaitingRoomItem, rhs: WaitingRoomItem) -> Bool {
	guard
     lhs.id == rhs.id, 
     lhs.typeId == rhs.typeId
    else { return false }
    return true
}
// MARK: - WholeAccount AutoEquatable
extension WholeAccount: Equatable {} 
internal func == (lhs: WholeAccount, rhs: WholeAccount) -> Bool {
	guard
     lhs.account == rhs.account, 
     lhs.detail == rhs.detail
    else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
// MARK: - Account.AccountType AutoEquatable
extension Account.AccountType: Equatable {}
internal func == (lhs: Account.AccountType, rhs: Account.AccountType) -> Bool {
    switch (lhs, rhs) {
     case (.`internal`, .`internal`): 
         return true 
     case (.external, .external): 
         return true 
    default: return false
    }
}
// MARK: - AccountedTransactionFilterScope AutoEquatable
extension AccountedTransactionFilterScope: Equatable {}
internal func == (lhs: AccountedTransactionFilterScope, rhs: AccountedTransactionFilterScope) -> Bool {
    switch (lhs, rhs) {
     case (.all, .all): 
         return true 
     case (.incomming, .incomming): 
         return true 
     case (.outgoing, .outgoing): 
         return true 
    default: return false
    }
}
// MARK: - Authorizer.Error AutoEquatable
extension Authorizer.Error: Equatable {}
internal func == (lhs: Authorizer.Error, rhs: Authorizer.Error) -> Bool {
    switch (lhs, rhs) {
     case (.undefined, .undefined): 
         return true 
     case (.uninstalled, .uninstalled): 
         return true 
     case (.disactivated, .disactivated): 
         return true 
     case (.failedToResolveStatus, .failedToResolveStatus): 
         return true 
     case (.accessBlocked, .accessBlocked): 
         return true 
     case (.accessApprovalFailed, .accessApprovalFailed): 
         return true 
    default: return false
    }
}
// MARK: - BCPListScope AutoEquatable
extension BCPListScope: Equatable {}
internal func == (lhs: BCPListScope, rhs: BCPListScope) -> Bool {
    switch (lhs, rhs) {
     case (.all, .all): 
         return true 
     case (.domestic, .domestic): 
         return true 
     case (.crossboarder, .crossboarder): 
         return true 
    default: return false
    }
}
// MARK: - BlockedOrderFilterScope AutoEquatable
extension BlockedOrderFilterScope: Equatable {}
internal func == (lhs: BlockedOrderFilterScope, rhs: BlockedOrderFilterScope) -> Bool {
    switch (lhs, rhs) {
     case (.all, .all): 
         return true 
     case (.card, .card): 
         return true 
     case (.other, .other): 
         return true 
    default: return false
    }
}
// MARK: - ExRate.Kind AutoEquatable
extension ExRate.Kind: Equatable {}
internal func == (lhs: ExRate.Kind, rhs: ExRate.Kind) -> Bool {
    switch (lhs, rhs) {
     case (.exchange, .exchange): 
         return true 
     case (.currency, .currency): 
         return true 
    default: return false
    }
}
// MARK: - Payment.Scope AutoEquatable
extension Payment.Scope: Equatable {}
internal func == (lhs: Payment.Scope, rhs: Payment.Scope) -> Bool {
    switch (lhs, rhs) {
    case (.domestic(let lhs), .domestic(let rhs)): 
        return lhs == rhs
    case (.foreign(let lhs), .foreign(let rhs)): 
        return lhs == rhs
    default: return false
    }
}
// MARK: - PaymentValidator.GlobalScope AutoEquatable
extension PaymentValidator.GlobalScope: Equatable {}
internal func == (lhs: PaymentValidator.GlobalScope, rhs: PaymentValidator.GlobalScope) -> Bool {
    switch (lhs, rhs) {
     case (.domestic, .domestic): 
         return true 
     case (.foreign, .foreign): 
         return true 
    default: return false
    }
}
// MARK: - RejectedOrderFilterScope AutoEquatable
extension RejectedOrderFilterScope: Equatable {}
internal func == (lhs: RejectedOrderFilterScope, rhs: RejectedOrderFilterScope) -> Bool {
    switch (lhs, rhs) {
     case (.last, .last): 
         return true 
     case (.other, .other): 
         return true 
    default: return false
    }
}
// MARK: - Session.State AutoEquatable
extension Session.State: Equatable {}
internal func == (lhs: Session.State, rhs: Session.State) -> Bool {
    switch (lhs, rhs) {
     case (.unauthorized, .unauthorized): 
         return true 
     case (.sessionExpired, .sessionExpired): 
         return true 
    case (.loggedIn(let lhs), .loggedIn(let rhs)): 
        return lhs == rhs
    case (.loggedInWithContract(let lhs), .loggedInWithContract(let rhs)): 
        if lhs.0 != rhs.0 { return false }
        if lhs.1 != rhs.1 { return false }
        if lhs.2 != rhs.2 { return false }
        return true
    default: return false
    }
}
// MARK: - TemplatesListScope AutoEquatable
extension TemplatesListScope: Equatable {}
internal func == (lhs: TemplatesListScope, rhs: TemplatesListScope) -> Bool {
    switch (lhs, rhs) {
     case (.all, .all): 
         return true 
     case (.domestic, .domestic): 
         return true 
     case (.domesticFX, .domesticFX): 
         return true 
     case (.crossboarder, .crossboarder): 
         return true 
     case (.sepa, .sepa): 
         return true 
    default: return false
    }
}
// MARK: - ViewPager.Direction AutoEquatable
extension ViewPager.Direction: Equatable {}
internal func == (lhs: ViewPager.Direction, rhs: ViewPager.Direction) -> Bool {
    switch (lhs, rhs) {
     case (.none, .none): 
         return true 
     case (.top, .top): 
         return true 
     case (.left, .left): 
         return true 
     case (.right, .right): 
         return true 
     case (.bottom, .bottom): 
         return true 
    default: return false
    }
}
// MARK: - WaitingOrderFilterScope AutoEquatable
extension WaitingOrderFilterScope: Equatable {}
internal func == (lhs: WaitingOrderFilterScope, rhs: WaitingOrderFilterScope) -> Bool {
    switch (lhs, rhs) {
     case (.all, .all): 
         return true 
     case (.standing, .standing): 
         return true 
     case (.other, .other): 
         return true 
    default: return false
    }
}

// MARK: -
