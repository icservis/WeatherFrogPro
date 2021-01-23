// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length, line_length
protocol LocalizationTranslatable {
    static func tr(_ key: String, _ args: CVarArg...) -> String
}

// default implementation, could be overrided by extension Localization
fileprivate extension LocalizationTranslatable {
    static func tr(_ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, bundle: Bundle(for: LocalizationBundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}


// swiftlint:disable:next type_body_length

enum Localization: String {
  /// Balance as of
  case accountAccountBalanceDate = "Account:account balance date"
  /// Zůstatek k %1$@
  static func accountAccountBalanceToDate(_ string1: String) -> String {
    return self.tr("Account:account balance to date", string1)
  }
  /// Account category
  case accountAccountCategory = "Account:account category"
  /// Payments account number
  case accountAccountForPayments = "Account:account for payments"
  /// Statements account number
  case accountAccountForStatements = "Account:account for statements"
  /// Account number
  case accountAccountNumberToDisplay = "Account:account number to display"
  /// Name
  case accountAccountName = "Account:accountName"
  /// Current balance
  case accountActualBalance = "Account:actual balance"
  /// Overdue
  case accountAmountAfterMaturity = "Account:amount after maturity"
  /// Balance
  case accountBalance = "Account:balance"
  /// Bank name
  case accountBankName = "Account:bank name"
  /// Blocked account
  case accountBlocked = "Account:blocked"
  /// Agreement signature date
  case accountContractSignatureDate = "Account:contract signature date"
  /// Added on
  case accountCreationDate = "Account:creation date"
  /// ČSOB CEB portal functionality only.
  case accountCsobRoom = "Account:csob room"
  /// Current full instalment
  case accountCurrentFullInstalment = "Account:current full instalment"
  /// Current minimum instalment
  case accountCurrentMinimalInstalment = "Account:current minimal instalment"
  /// Detail
  case accountDetail = "Account:detail"
  /// Instalment date
  case accountDueDate = "Account:due date"
  /// To display accounts please contact Helpdesk or a person authorized to administer the service.
  case accountEmptyMessage = "Account:empty:message"
  /// No accounts have been assigned to you.
  case accountEmptyTitle = "Account:empty:title"
  /// Waiting room is not available at the moment.
  case accountErrorWaitingRoomClosed = "Account:error:waiting room closed"
  /// Loan due date
  case accountFinalDueDate = "Account:final due date"
  /// Loan due date
  case accountFinalMaturityDate = "Account:final maturity date"
  /// Fixation date
  case accountFixationDate = "Account:fixation date"
  /// IBAN
  case accountIban = "Account:iban"
  /// The account is a part of the credit limit
  case accountIbisCreditLimitList = "Account:ibis credit limit list"
  /// Due date
  case accountInstalmentDate = "Account:instalment date"
  /// Interest method
  case accountInterestCalcMethod = "Account:interest calc method"
  /// Interest rate in the previous period
  case accountInterestForRegularPeriod = "Account:interest for regular period"
  /// Current interest rate
  case accountInterestRate = "Account:interest rate"
  /// Last principal instalment date
  case accountLastInstalmentDate = "Account:last instalment date"
  /// EXTERNAL ACCOUNT
  case accountListTypeExternal = "Account:list:type:external"
  /// Line of credit
  case accountLoanFacilityLimit = "Account:loan facility limit"
  /// Latest drawdown date
  case accountMaxWithdrawDate = "Account:max withdraw date"
  /// Next instalment amount
  case accountNextInstalmentAmount = "Account:next instalment amount"
  /// Next instalment
  case accountNextInstalmentDate = "Account:next instalment date"
  /// Notice period
  case accountNoticePeriod = "Account:noticePeriod"
  /// Created on
  case accountOpeningDate = "Account:opening date"
  /// No transactions to display
  case accountOverviewNoTransactions = "Account:overview:no transactions"
  /// Show full history
  case accountOverviewShowHistory = "Account:overview:show history"
  /// Account type
  case accountProductType = "Account:product type"
  /// Recommended payment date
  case accountRecommendedInstalmentDate = "Account:recommended instalment date"
  /// Popis situace a důvodů, proč nemusí být dostupný žádný účet na kontaktu nebo pro daného uživatele.
  case accountSearchMessage = "Account:search:message"
  /// Search account
  case accountSearchPlaceholder = "Account:search:placeholder"
  /// No records
  case accountSearchTitle = "Account:search:title"
  /// SWIFT
  case accountSwift = "Account:swift"
  /// Cards
  case accountTabCards = "Account:tab:cards"
  /// Detail
  case accountTabDetail = "Account:tab:detail"
  /// Overview
  case accountTabOverview = "Account:tab:overview"
  /// Duration
  case accountTermDuration = "Account:term duration"
  /// Last balance update
  case accountTimestamp = "Account:timestamp"
  /// Movements
  case accountTransactions = "Account:transactions"
  /// Adresa banky
  case addressBankIntBankAddress1Hint = "AddressBankInt:bank address 1:hint"
  /// Adresa banky 2 (nepovinné)
  case addressBankIntBankAddress2Hint = "AddressBankInt:bank address 2:hint"
  /// Název banky
  case addressBankIntBankName1Hint = "AddressBankInt:bank name 1:hint"
  /// Název banky 2 (nepovinné)
  case addressBankIntBankName2Hint = "AddressBankInt:bank name 2:hint"
  /// Zadejte SWIFT nebo údaje banky protistrany
  case addressBankIntRequiredOrSwift = "AddressBankInt:required or Swift"
  /// Banka protistrany
  case addressBankIntTitle = "AddressBankInt:title"
  /// ČSOB Smart key has been blocked.
  case authorizerBlocked = "Authorizer:blocked"
  /// Contact Help desk to unblock ČSOB Smart key.
  case authorizerBlockedText = "Authorizer:blocked:text"
  /// Login via ČSOB Smart key failed.
  case authorizerFailed = "Authorizer:failed"
  /// Please, try again. If your problem persists, contact Helpdesk.
  case authorizerFailedText = "Authorizer:failed:text"
  /// You have been logged out due to inactivity.
  case authorizerInactivity = "Authorizer:inactivity"
  /// Log in again
  case authorizerInactivityBody = "Authorizer:inactivity:body"
  /// ČSOB Smart key has been installed, but not activated yet.
  case authorizerNotactivated = "Authorizer:notactivated"
  /// Activate ČSOB Smart key
  case authorizerNotactivatedAction = "Authorizer:notactivated:action"
  /// Due to the security reasons it is necessary to activate ČSOB Smart key before you log in to CEB Mobile.
  case authorizerNotactivatedText = "Authorizer:notactivated:text"
  /// Login to CEB Mobile requires ČSOB Smart key application which has not been installed yet.
  case authorizerNotinstalled = "Authorizer:notinstalled"
  /// Download ČSOB Smart key
  case authorizerNotinstalledAction = "Authorizer:notinstalled:action"
  /// Application is available in your application store.
  case authorizerNotinstalledText = "Authorizer:notinstalled:text"
  /// Automatické zpracování
  case automaticProcessingTitle = "AutomaticProcessing:title"
  /// Back
  case back = "Back"
  /// Cancel
  case cancel = "Cancel"
  /// Block card
  case cardActionBlock = "Card:action:block"
  /// Show PIN
  case cardActionShowPin = "Card:action:show pin"
  /// Unblock card
  case cardActionUnblock = "Card:action:unblock"
  /// Expiration
  case cardExpiration = "Card:expiration"
  /// Holder name
  case cardHolder = "Card:holder"
  /// Phone number
  case cardLimitCnpPhoneNumber = "Card:limit cnp:phone number"
  /// CNP remaining
  case cardLimitCnpRemaining = "Card:limit cnp:remaining"
  /// CNP limit
  case cardLimitCnpTotal = "Card:limit cnp:total"
  /// Turn off
  case cardLimitCnpTurnOff = "Card:limit cnp:turn off"
  /// Turn on
  case cardLimitCnpTurnOn = "Card:limit cnp:turn on"
  /// Remaining limit
  case cardLimitGlobalRemaining = "Card:limit global:remaining"
  /// Settings
  case cardLimitGlobalSettings = "Card:limit global:settings"
  /// Global limit
  case cardLimitGlobalTotal = "Card:limit global:total"
  /// Card not present payments
  case cardSectionCnp = "Card:section:cnp"
  /// Limits
  case cardSectionLimits = "Card:section:limits"
  /// Additional services
  case cardSectionServices = "Card:section:services"
  /// Card detail
  case cardTitle = "Card:title"
  /// 
  case cardsEmptyMessage = "Cards:empty:message"
  /// You have no cards
  case cardsEmptyTitle = "Cards:empty:title"
  /// Failed to load cards
  case cardsErrorMessage = "Cards:error message"
  /// Error
  case cardsErrorTitle = "Cards:error title"
  /// Managed by me
  case cardsManaged = "Cards:managed"
  /// 
  case cardsOwnEmptyMessage = "Cards:own empty:message"
  /// You have no cards
  case cardsOwnEmptyTitle = "Cards:own empty:title"
  /// My cards
  case cardsOwned = "Cards:owned"
  /// 
  case cardsSearchEmptyMessage = "Cards:search empty:message"
  /// You have no cards
  case cardsSearchEmptyTitle = "Cards:search empty:title"
  /// Search cards
  case cardsSearchPlaceholder = "Cards:search placeholder"
  /// Cards
  case cardsTitle = "Cards:title"
  /// Close
  case close = "Close"
  /// Approve
  case confirm = "Confirm"
  /// version v%1$@
  static func contactsAppVersion(_ string1: String) -> String {
    return self.tr("Contacts:app version", string1)
  }
  /// Device can not provide phone call!
  case contactsErrorDialer = "Contacts:error:dialer"
  /// Device not configured for sending mails!
  case contactsErrorMailer = "Contacts:error:mailer"
  /// Reason for blocking
  case contractBlockedHeader = "Contract:blocked header"
  /// To display agreements please contact administrator or Helpdesk.
  case contractEmptyMessage = "Contract:empty:message"
  /// Nejsou dostupné žádné kontrakty
  case contractEmptyTitle = "Contract:empty:title"
  /// Your access to the agreement has been blocked due to the following reasons:
  case contractErrorTitle = "Contract:error:title"
  /// Agreement ID:
  case contractIdTitle = "Contract:id:title"
  /// No agreements available
  case contractSearchEmptyHeader = "Contract:search:empty header"
  /// No record matches your request.
  case contractSearchMessage = "Contract:search:message"
  /// Search agreement
  case contractSearchPlaceholder = "Contract:search:placeholder"
  /// No records
  case contractSearchTitle = "Contract:search:title"
  /// Access via CEB Mobile has not been enabled in the agreement.
  case contractSelectBanned = "Contract:select:banned"
  /// Smart key login method has not been allowed in the agreement.
  case contractSelectBlocked = "Contract:select:blocked"
  /// The agreement is inactive.
  case contractSelectContractInactive = "Contract:select:contract inactive"
  /// Smart key login method has not been allowed in the agreement.
  case contractSelectNoAuthorization = "Contract:select:no authorization"
  /// You have not been activated as a user in the agreement.
  case contractSelectUserInactive = "Contract:select:user inactive"
  /// Adresa protistrany
  case counterpartyIntAddress1Hint = "CounterpartyInt:address 1:hint"
  /// Adresa protistrany 2
  case counterpartyIntAddress2Hint = "CounterpartyInt:address 2:hint"
  /// Země protistrany
  case counterpartyIntCountryHint = "CounterpartyInt:country:hint"
  /// Název protistrany
  case counterpartyIntNameHint = "CounterpartyInt:name:hint"
  /// Údaje protistrany
  case counterpartyIntTitle = "CounterpartyInt:title"
  /// EU00 0000 0000 0000
  case counterpartySepaNameHint = "CounterpartySepa:name:hint"
  /// Údaje protistrany
  case counterpartySepaTitle = "CounterpartySepa:title"
  /// Account list
  case dashboardBackTo = "Dashboard:Back to"
  /// Holds
  case dashboardBlocked = "Dashboard:Blocked"
  /// Rejected
  case dashboardRejected = "Dashboard:Rejected"
  /// Waiting
  case dashboardWaiting = "Dashboard:Waiting"
  /// Waiting room
  case dashboardWaitingRoom = "Dashboard:Waiting Room"
  /// Done
  case done = "Done"
  /// Bad request
  case errorBadRequest = "Error:Bad request"
  /// Bar response
  case errorBadResponse = "Error:Bad response"
  /// Please, fill in at least one of the fields.
  case errorBlank = "Error:blank"
  /// JSON Parse
  case errorJSONParsing = "Error:JSON Parsing"
  /// More information
  case errorMoreInfo = "Error:More info"
  /// An error occured
  case errorNetwork = "Error:network"
  /// No data
  case errorNoData = "Error:No data"
  /// No internet connection
  case errorOffline = "Error:offline"
  /// OK
  case errorOK = "Error:OK"
  /// Notice
  case errorTitle = "Error:Title"
  /// Try again
  case errorTryAgain = "Error:Try again"
  /// We are sorry. An error occurred on the CEB mobile.
  case errorUknown = "Error:Uknown"
  /// Could not load the messages.
  case errorUnableToLoadNews = "Error:unable to load news"
  /// Current clipboard content is not compatible.
  case errorUnableToPaste = "Error:unable to paste"
  /// Buy
  case exRateBuy = "ExRate:Buy"
  /// Foreign Currency
  case exRateCurrency = "ExRate:Currency"
  /// Actual Exchange rates are not available. Please try again later.
  case exRateEmptyMessage = "ExRate:empty:message"
  /// Exchange rates are not available
  case exRateEmptyTitle = "ExRate:empty:title"
  /// Couldn't load up-to-date ČSOB Exchange rates.
  case exRateErrorMessage = "ExRate:error:message"
  /// Error
  case exRateErrorTitle = "ExRate:error:title"
  /// Foreign Exchange 
  case exRateExchange = "ExRate:Exchange"
  /// Middle
  case exRateMiddle = "ExRate:Middle"
  /// Sell
  case exRateSell = "ExRate:Sell"
  /// validity %1$@
  static func exRatesValidTill(_ string1: String) -> String {
    return self.tr("ExRates:valid till", string1)
  }
  /// Poplatkování zahraniční platby
  case feesIntTitle = "FeesInt:title"
  /// Categories
  case helpButtonCategories = "Help:button:Categories"
  /// Display all
  case helpButtonShowAll = "Help:button:Show all"
  /// Popis situace a důvodů, proč nemusi být dostupné spojení atp., a výzva k manuálnimu opakování.
  case helpErrorMessage = "Help:error:message"
  /// Nelze načíst seznam nápovědy
  case helpErrorTitle = "Help:error:title"
  /// You could be interested in:
  case helpRelevantQuestions = "Help:relevant questions"
  /// Podle zadaných parametrů se nic nepodařilo najít.
  case helpSearchMessage = "Help:search:message"
  /// Nejsou žádné výsledky
  case helpSearchTitle = "Help:search:title"
  /// Zadání SEPA identifikace
  case identSepaPlaceholder = "IdentSepa:placeholder"
  /// Identifikace SEPA platby
  case identSepaTitle = "IdentSepa:title"
  /// Pokyny ke zpracování, deal FX, atp.
  case instructionIntHint = "InstructionInt:hint"
  /// Instrukce bance
  case instructionIntTitle = "InstructionInt:title"
  /// Platbu s instrukcí bance zadáte jako zahraniční příkaz. Přejete si pokračovat?
  case instructionIntSwitchConfirmation = "InstructionIntSwitch:confirmation"
  /// Some warning text
  case instructionIntSwitchHint = "InstructionIntSwitch:hint"
  /// Chci zadat instrukci bance
  case instructionIntSwitchTitle = "InstructionIntSwitch:title"
  /// Legal info
  case legalInfo = "LegalInfo"
  /// More informations
  case loginMoreInfo = "Login:More info"
  /// Account list
  case menuAccounts = "Menu:Accounts"
  /// Atms
  case menuAtms = "Menu:Atms"
  /// Blocked Orders
  case menuBlockedOrders = "Menu:Blocked Orders"
  /// Branches
  case menuBranches = "Menu:Branches"
  /// Cards
  case menuCards = "Menu:Cards"
  /// Select ČSOB CEB Agreement
  case menuChangeContract = "Menu:Change Contract"
  /// Contacts
  case menuContacts = "Menu:Contacts"
  /// Select ČSOB CEB Agreement
  case menuContractChange = "Menu:contract:change"
  /// Exchange rates
  case menuExchangeRates = "Menu:Exchange Rates"
  /// Help
  case menuFAQ = "Menu:FAQ"
  /// Login
  case menuLogin = "Menu:Login"
  /// Logout
  case menuLogout = "Menu:Logout"
  /// News
  case menuMessages = "Menu:Messages"
  /// Messages
  case menuNews = "Menu:News"
  /// Payments
  case menuPayments = "Menu:Payments"
  /// Rejected Orders
  case menuRejectedOrders = "Menu:Rejected Orders"
  /// Settings
  case menuSettings = "Menu:Settings"
  /// Movements
  case menuTransactions = "Menu:Transactions"
  /// Waiting Orders
  case menuWaitingOrders = "Menu:Waiting Orders"
  /// Card transaction
  case messageCardTransaction = "Message:card:transaction"
  /// Cash deposit via ATM
  case messageCashDepositAtm = "Message:cash:deposit:atm"
  /// Cash pooling transaction
  case messageCashPoolingTransaction = "Message:cash:pooling:transaction"
  /// Cash transaction
  case messageCashTransaction = "Message:cash:transaction"
  /// Branch cash transaction
  case messageCashTransactionBranch = "Message:cash:transaction:branch"
  /// Cash transaction at the Czech Post
  case messageCashTransactionCzPost = "Message:cash:transaction:cz:post"
  /// Cash transactions via night safe box
  case messageCashTransactionNightBox = "Message:cash:transaction:night:box"
  /// Cash transaction - other
  case messageCashTransactionOther = "Message:cash:transaction:other"
  /// Cash transaction via secured case
  case messageCashTransactionSecuredCase = "Message:cash:transaction:secured:case"
  /// Cross-border payment order
  case messageCrossborderPayment = "Message:crossborder:payment"
  /// Direct debit transfer
  case messageDirectDebitTransfer = "Message:direct:debit:transfer"
  /// Domestic direct debit transfer
  case messageDirectDebitTransferDomestic = "Message:direct:debit:transfer:domestic"
  /// Other direct debit transfer
  case messageDirectDebitTransferOther = "Message:direct:debit:transfer:other"
  /// SEPA direct debit  transfer
  case messageDirectDebitTransferSepa = "Message:direct:debit:transfer:sepa"
  /// Payment order
  case messageDomesticPayment = "Message:domestic:payment"
  /// Priority payment order
  case messageDomesticPaymentPriority = "Message:domestic:payment:priority"
  /// Fee
  case messageFee = "Message:fee"
  /// Holds
  case messageHolds = "Message:holds"
  /// Interest
  case messageInterest = "Message:interest"
  /// Tiered interest
  case messageInterestCalcMethod = "Message:interestCalcMethod"
  /// Not available
  case messageInterestRateNotAvailable = "Message:interestRateNotAvailable"
  /// last half-year
  case messageLastHalfYear = "Message:last:half:year"
  /// last month
  case messageLastMonth = "Message:last:month"
  /// last week
  case messageLastWeek = "Message:last:week"
  /// last year
  case messageLastYear = "Message:last:year"
  /// More currencies
  case messageMoreCurrencies = "Message:more:currencies"
  /// next
  case messageNext = "Message:next"
  /// next half-year
  case messageNextHalfYear = "Message:next:half:year"
  /// next month
  case messageNextMonth = "Message:next:month"
  /// next week
  case messageNextWeek = "Message:next:week"
  /// next year
  case messageNextYear = "Message:next:year"
  /// No
  case messageNo = "Message:no"
  /// older
  case messageOlder = "Message:older"
  /// Rejected orders
  case messageRejectedOrders = "Message:rejected:orders"
  /// Search results
  case messageSearchResults = "Message:search:results"
  /// SEPA transfer
  case messageSepaCreditTransfer = "Message:sepa:credit:transfer"
  /// Standing payment order
  case messageStandingDomesticPayment = "Message:standing:domestic:payment"
  /// Standing SEPA transfer
  case messageStandingSepaCreditTransfer = "Message:standing:sepa:credit:transfer"
  /// this half-year
  case messageThisHalfYear = "Message:this:half:year"
  /// this month
  case messageThisMonth = "Message:this:month"
  /// this week
  case messageThisWeek = "Message:this:week"
  /// this year
  case messageThisYear = "Message:this:year"
  /// today
  case messageToday = "Message:today"
  /// tomorrow
  case messageTomorrow = "Message:tomorrow"
  /// Cash transactions via flexicash
  case messageTransactionFlexicash = "Message:transaction:flexicash"
  /// Movements
  case messageTransactionHistory = "Message:transaction:history"
  /// Other transaction
  case messageTransactionOther = "Message:transaction:other"
  /// Waiting for processing
  case messageWaitingOrders = "Message:waiting:orders"
  /// Yes
  case messageYes = "Message:yes"
  /// yesterday
  case messageYesterday = "Message:yesterday"
  /// Messages
  case newsDetailTitle = "News:detail:title"
  /// No messages to be displayed.
  case newsEmptyMessage = "News:empty:message"
  /// No messages
  case newsEmptyTitle = "News:empty:title"
  /// Popis situace a důvodů, proč nemusi být dostupné spojení atp., a výzva k manuálnimu opakování.
  case newsErrorMessage = "News:error:message"
  /// Nelze načíst seznam zpráv
  case newsErrorTitle = "News:error:title"
  /// OK
  case ok = "OK"
  /// Pole musí obsahovat minimálně 3 alfanumerické znaky, neopakující se po sobě
  case purposeIntInvalid = "PurposeInt:invalid"
  /// Vyplňte prosím účel platby
  case purposeIntRequired = "PurposeInt:required"
  /// 00000000
  case referencePayerPlaceholder = "ReferencePayer:placeholder"
  /// Reference plátce
  case referencePayerTitle = "ReferencePayer:title"
  /// Save
  case save = "Save"
  /// On account
  case searchAccount = "Search:account"
  /// choose at least one account
  case searchAccountBlank = "Search:account:blank"
  /// Account
  case searchAccountNumber = "Search:accountNumber"
  /// Search
  case searchAction = "Search:action"
  /// Amount
  case searchAmount = "Search:amount"
  /// Amount from
  case searchAmountFrom = "Search:amountFrom"
  /// Hold type
  case searchBlockingType = "Search:blockingType"
  /// Continue
  case searchButtonContinue = "Search:button:continue"
  /// Currency
  case searchCurrencyId = "Search:currencyId"
  /// Date from
  case searchDate = "Search:date"
  /// Incoming
  case searchDirectionIncoming = "Search:direction:incoming"
  /// Outgoing
  case searchDirectionOutgoing = "Search:direction:outgoing"
  /// No record matches your request.
  case searchEmptyBody = "Search:emptyBody"
  /// No records
  case searchEmptyHeader = "Search:emptyHeader"
  /// Other fields
  case searchExtraFields = "Search:extraFields"
  /// from
  case searchFrom = "Search:from"
  /// Search text fields such as counterparty's names, internal notes, payer's reference, address and others.
  case searchInfo = "Search:info"
  /// Interest rate
  case searchInterestRate = "Search:interest rate"
  /// Constant symbol
  case searchKS = "Search:KS"
  /// Payment type
  case searchOrderType = "Search:orderType"
  /// Counterparty account number
  case searchReceiverAccount = "Search:receiverAccount"
  /// Bank
  case searchReceiverBank = "Search:receiverBank"
  /// Search results
  case searchResultTitle = "Search:resultTitle"
  /// Choose
  case searchSelect = "Search:select"
  /// Sort by
  case searchSort = "Search:sort"
  /// amount in ascending order
  case searchSortAmountAsc = "Search:sort:amount:asc"
  /// amount in descending order
  case searchSortAmountDesc = "Search:sort:amount:desc"
  /// date, oldest to newest
  case searchSortDateAsc = "Search:sort:date:asc"
  /// date, newest to oldest
  case searchSortDateDesc = "Search:sort:date:desc"
  /// due date, earliest first
  case searchSortDueAsc = "Search:sort:due:asc"
  /// due date, latest first
  case searchSortDueDesc = "Search:sort:due:desc"
  /// Specific symbol
  case searchSS = "Search:SS"
  /// Text field
  case searchText = "Search:text"
  /// Contains text
  case searchTextFieldSearch = "Search:textFieldSearch"
  /// Searched text
  case searchTextPlaceholder = "Search:textPlaceholder"
  /// Search
  case searchTitle = "Search:title"
  /// to
  case searchTo = "Search:to"
  /// Payment status
  case searchTransactionStatus = "Search:transactionStatus"
  /// Transaction type
  case searchTransactionType = "Search:transactionType"
  /// Variable symbol
  case searchVS = "Search:VS"
  /// Adobe Analytics
  case settingsAnalytics = "Settings:analytics"
  /// CEB Mobile uses Adobe Analytics (Adobe, Inc.) which evaluates the behaviour of application and its users to its continuous improvements. ČSOB does not provide any personal, financial or sensitive user data.
  case settingsOptionAnalyticsInfo = "Settings:option:analytics info"
  /// Enable Adobe Analytics
  case settingsOptionAnalyticsOptin = "Settings:option:analytics:optin"
  /// Smart Key Emulator
  case settingsOptionAuthEmulator = "Settings:option:AuthEmulator"
  /// Debug mode
  case settingsOptionDebugMode = "Settings:option:Debug Mode"
  /// API enviroment
  case settingsOptionEnvironment = "Settings:option:Environment"
  /// Allow enhanced user interface
  case settingsOptionMagicOptin = "Settings:option:magic:optin"
  /// Select option
  case settingsOptionSelect = "Settings:option:select"
  /// Common settings
  case settingsSectionAnalyticsFooter = "Settings:section:analytics:footer"
  /// Analytic data
  case settingsSectionAnalyticsTitle = "Settings:section:analytics:title"
  /// Developer settings
  case settingsSectionDevelopment = "Settings:section:development"
  /// Functionality does not comply to required design!
  case settingsSectionMagicFooter = "Settings:section:magic:footer"
  /// Experimental functionality
  case settingsSectionMagicTitle = "Settings:section:magic:title"
  /// Common settings
  case settingsSectionPublic = "Settings:section:public"
  /// Settings
  case settingsTitle = "Settings:title"
  /// Československé obchodní banky, a.s.
  case sharingAccountCsob = "Sharing:account:csob"
  /// Account %1$@, currency %2$@, held with %3$@ (BIC/SWIFT code %4$@). Account holder %5$@.
  static func sharingAccountText(_ string1: String, _ string2: String, _ string3: String, _ string4: String, _ string5: String) -> String {
    return self.tr("Sharing:account:text", string1, string2, string3, string4, string5)
  }
  /// Account %1$@, currency %2$@, held with %3$@. Account holder %4$@.
  static func sharingAccountTextIban(_ string1: String, _ string2: String, _ string3: String, _ string4: String) -> String {
    return self.tr("Sharing:account:textIban", string1, string2, string3, string4)
  }
  /// Sharing is not implemented
  case sharingErrorNotImplemented = "Sharing:error:not implemented"
  /// Share via PDF
  case sharingOptionPdf = "Sharing:option:pdf"
  /// Share via Text
  case sharingOptionText = "Sharing:option:text"
  /// Choose sharing option
  case sharingTitle = "Sharing:title"
  /// SORT_TA_AMOUNT_ASC
  case sortTaAmountAsc = "SORT_TA_AMOUNT_ASC"
  /// SORT_TA_AMOUNT_DESC
  case sortTaAmountDesc = "SORT_TA_AMOUNT_DESC"
  /// SORT_TA_DATE_ASC
  case sortTaDateAsc = "SORT_TA_DATE_ASC"
  /// SORT_TA_DATE_DESC
  case sortTaDateDesc = "SORT_TA_DATE_DESC"
  /// SORT_TD_AMOUNT_ASC
  case sortTdAmountAsc = "SORT_TD_AMOUNT_ASC"
  /// SORT_TD_AMOUNT_DESC
  case sortTdAmountDesc = "SORT_TD_AMOUNT_DESC"
  /// SORT_TD_DATE_ASC
  case sortTdDateAsc = "SORT_TD_DATE_ASC"
  /// SORT_TD_DATE_DESC
  case sortTdDateDesc = "SORT_TD_DATE_DESC"
  /// SORT_TH_AMOUNT_ASC
  case sortThAmountAsc = "SORT_TH_AMOUNT_ASC"
  /// SORT_TH_AMOUNT_DESC
  case sortThAmountDesc = "SORT_TH_AMOUNT_DESC"
  /// SORT_TH_DATE_ASC
  case sortThDateAsc = "SORT_TH_DATE_ASC"
  /// SORT_TH_DATE_DESC
  case sortThDateDesc = "SORT_TH_DATE_DESC"
  /// SORT_TW_AMOUNT_ASC
  case sortTwAmountAsc = "SORT_TW_AMOUNT_ASC"
  /// SORT_TW_AMOUNT_DESC
  case sortTwAmountDesc = "SORT_TW_AMOUNT_DESC"
  /// SORT_TW_DATE_ASC
  case sortTwDateAsc = "SORT_TW_DATE_ASC"
  /// SORT_TW_DATE_DESC
  case sortTwDateDesc = "SORT_TW_DATE_DESC"
  /// Automatické zpracování transakce je aktivní, musíte vyplnit SWIFT kód
  case swiftAutomaticProcessingError = "Swift:automatic processing:error"
  /// Automatické zpracování transakce je aktivní, musíte vyplnit SWIFT kód
  case swiftAutomaticProcessingHint = "Swift:automatic processing:hint"
  /// Zadaný SWIFT kód neexistuje – opravte
  case swiftDoesNotExist = "Swift:does not exist"
  /// SWIFT musí mít délku 8 nebo 11 znaků
  case swiftInvalidLength = "Swift:invalid length"
  /// SWIFT kód nesouhlasí s IBANem
  case swiftNotMatchingIBAN = "Swift:not matching IBAN"
  /// SWIFT / BIC
  case swiftPlaceholder = "Swift:placeholder"
  /// SWIFT / BIC kód
  case swiftTitle = "Swift:title"
  /// Zvolte neznáte-li SWIFT kód, platbu bude možné zpracovat se zadanou adresou banky protistrany
  case swiftSwitchHint = "SwiftSwitch:hint"
  /// Nemám SWIFT, zadám banku protistrany
  case swiftSwitchTitle = "SwiftSwitch:title"
  /// Today
  case today = "Today"
  /// Fees
  case transactionAccountFees = "Transaction:accountFees"
  /// Posting date
  case transactionAccountingDate = "Transaction:accountingDate"
  /// Current balance
  case transactionActualBalance = "Transaction:actualBalance"
  /// Sum
  case transactionAmountSum = "Transaction:AmountSum"
  /// Available balance
  case transactionAvailableBalance = "Transaction:available balance"
  /// Transactions
  case transactionBackTo = "Transaction:Back to"
  /// Counterparty's bank country
  case transactionBankAddressCountry = "Transaction:bankAddress:country"
  /// Bank reference
  case transactionBankReference = "Transaction:bankReference"
  /// Import name
  case transactionBatchName = "Transaction:batchName"
  /// No holds
  case transactionBlocationEmptyHeader = "Transaction:blocation:empty:header"
  /// Account holds
  case transactionBlockedTitle = "Transaction:blocked:title"
  /// Cards
  case transactionCards = "Transaction:cards"
  /// Send confirmation to
  case transactionConfirmationNumber = "Transaction:ConfirmationNumber"
  /// Phone number
  case transactionContact = "Transaction:Contact"
  /// Additional information
  case transactionCreditorInfo = "Transaction:creditorInfo"
  /// Final beneficiary
  case transactionCreditorName = "Transaction:creditorName"
  /// Charged to the counterparty's account
  case transactionDebitingDate = "Transaction:debiting date"
  /// Method of delivery in another country
  case transactionDeliveryMethodId = "Transaction:DeliveryMethodId"
  /// No record matches your request.
  case transactionEmptyBody = "Transaction:empty:body"
  /// No records
  case transactionEmptyHeader = "Transaction:empty:header"
  /// Na účtu nejsou žádné transakce.
  case transactionEmptyMessage = "Transaction:empty:message"
  /// No movements
  case transactionEmptyTitle = "Transaction:empty:title"
  /// Identifier
  case transactionEndToEndId = "Transaction:endToEndId"
  /// Exchange rate
  case transactionExchangeRate = "Transaction:exchangeRate"
  /// Fee code
  case transactionFeeMethodTypeCode = "Transaction:feeMethodTypeCode"
  /// Correspondent banks' fees
  case transactionFeeOther = "Transaction:feeOther"
  /// Fees
  case transactionFeesMethodTypeCode = "Transaction:FeesMethodTypeCode"
  /// Transaction identifier
  case transactionId = "Transaction:id"
  /// Id
  case transactionIdTran = "Transaction:idTran"
  /// Revenues
  case transactionIncoming = "Transaction:incoming"
  /// Instruction to the bank
  case transactionInfoForBank = "Transaction:InfoForBank"
  /// Invoice number
  case transactionInvoiceNumber = "Transaction:InvoiceNumber"
  /// Item count
  case transactionItemCount = "Transaction:ItemCount"
  /// Last 31 days
  case transactionLast31 = "Transaction:last31"
  /// Rejected payments
  case transactionLoadingTitle = "Transaction:loading:title"
  /// Message to beneficiary and payer
  case transactionMessage = "Transaction:message"
  /// Send confirmation to
  case transactionMessageConfirmation = "Transaction:Message:Confirmation"
  /// Additional information
  case transactionMoreInfo = "Transaction:moreInfo"
  /// Internal comment
  case transactionNarrative = "Transaction:narrative"
  /// Na tomto účtu nemáte žádné blokované transakce.
  case transactionNoBlockedTransactions = "Transaction:no blocked transactions"
  /// Older
  case transactionOlder = "Transaction:older"
  /// Operation date
  case transactionOperationDate = "Transaction:OperationDate"
  /// Phone number for the selected operation
  case transactionOperationNumber = "Transaction:operationNumber"
  /// Top-up time
  case transactionOperationTime = "Transaction:OperationTime"
  /// Expenses
  case transactionOutgoing = "Transaction:outgoing"
  /// Counterparty's bank address
  case transactionPartyBankAddress = "Transaction:partyBankAddress"
  /// SWIFT/BIC
  case transactionPartyBankCode = "Transaction:partyBankCode"
  /// Counterparty name
  case transactionPartyName = "Transaction:PartyName"
  /// Payer's reference
  case transactionPayersReference = "Transaction:payersReference"
  /// REF
  case transactionReference = "Transaction:reference"
  /// Na tomto účtu nejsou žádné odmítnuté transakce.
  case transactionRejectedEmptyBody = "Transaction:rejected:empty:body"
  /// No rejected
  case transactionRejectedEmptyHeader = "Transaction:rejected:empty:header"
  /// Reason for rejection
  case transactionRejectionReason = "Transaction:rejectionReason"
  /// Purpose of payment
  case transactionRemittanceInformation = "Transaction:remittanceInformation"
  /// Amount type
  case transactionRepaymentTypeId = "Transaction:RepaymentTypeId"
  /// No movements
  case transactionScreenEmpty = "Transaction:screen empty"
  /// Na tomto účtu nejsou za posledních 18 měsíců žádné pohyby.
  case transactionScreenEmptyBody = "Transaction:screen empty body"
  /// Waiting for processing
  case transactionScreenLoadingTitle = "Transaction:screen:loading:title"
  /// Search all accounts
  case transactionSearchAction = "Transaction:search:action"
  /// Haven’t found what you’re looking for?
  case transactionSearchLabel = "Transaction:search:label"
  /// No record matches your request.
  case transactionSearchMessage = "Transaction:search:message"
  /// Change parameters
  case transactionSearchSecondAction = "Transaction:search:second action"
  /// No records
  case transactionSearchTitle = "Transaction:search:title"
  /// Standing orders
  case transactionStandingOrders = "Transaction:standing:orders"
  /// Status
  case transactionStatusId = "Transaction:statusId"
  /// Mobile phone number you want to top up
  case transactionTelephoneNumber = "Transaction:telephoneNumber"
  /// Movements
  case transactionTitle = "Transaction:title"
  /// Internal comment
  case transactionTransactionNote = "Transaction:transaction note"
  /// Transaction detail
  case transactionTransactionDescription = "Transaction:transactionDescription"
  /// Original payer
  case transactionUltimateDebtorName = "Transaction:ultimateDebtorName"
  /// Current view doesn't contain any records.
  case transactionViewEmptyBody = "Transaction:view empty body"
  /// No record matches your request.
  case transactionWaitingEmptyBody = "Transaction:waiting:empty:body"
  /// No waiting
  case transactionWaitingEmptyHeader = "Transaction:waiting:empty:header"
  /// Accounted transactions
  case transactionFilterAccountedTransactions = "TransactionFilter:Accounted transactions"
  /// Všechny
  case transactionFilterAccountedScopeAll = "TransactionFilter:Accounted:ScopeAll"
  /// Revenues
  case transactionFilterAccountedScopeIncomming = "TransactionFilter:Accounted:ScopeIncomming"
  /// Expenses
  case transactionFilterAccountedScopeOutgoing = "TransactionFilter:Accounted:ScopeOutgoing"
  /// Blocked orders
  case transactionFilterBlockedOrders = "TransactionFilter:Blocked orders"
  /// Všechny
  case transactionFilterBlockedScopeAll = "TransactionFilter:Blocked:ScopeAll"
  /// Cards
  case transactionFilterBlockedScopeCard = "TransactionFilter:Blocked:ScopeCard"
  /// Ostatní
  case transactionFilterBlockedScopeOther = "TransactionFilter:Blocked:ScopeOther"
  /// Rejected orders
  case transactionFilterRejectedOrders = "TransactionFilter:Rejected orders"
  /// Last 31 days
  case transactionFilterRejectedScopeLast = "TransactionFilter:Rejected:ScopeLast"
  /// All
  case transactionFilterRejectedScopeOther = "TransactionFilter:Rejected:ScopeOther"
  /// Všechny
  case transactionFilterScopeAll = "TransactionFilter:ScopeAll"
  /// Other
  case transactionFilterScopeOther = "TransactionFilter:ScopeOther"
  /// Waiting for processing
  case transactionFilterWaitingOrders = "TransactionFilter:Waiting orders"
  /// Všechny
  case transactionFilterWaitingScopeAll = "TransactionFilter:Waiting:ScopeAll"
  /// Ostatní
  case transactionFilterWaitingScopeOther = "TransactionFilter:Waiting:ScopeOther"
  /// Standings
  case transactionFilterWaitingScopeStandings = "TransactionFilter:Waiting:ScopeStandings"
  /// Doplňující údaj
  case ultimateCreditorInfoPlaceholder = "UltimateCreditor:info:placeholder"
  /// Je vyplněno "Jméno konečného příjemce", vyplňte pole "Doplňující údaj"
  case ultimateCreditorInfoRequired = "UltimateCreditor:info:required"
  /// Název končného příjemce
  case ultimateCreditorPlaceholder = "UltimateCreditor:placeholder"
  /// Konečný příjemce
  case ultimateCreditorTitle = "UltimateCreditor:title"
  /// Doplňující údaj
  case ultimateDebtorInfoPlaceholder = "UltimateDebtor:info:placeholder"
  /// Je vyplněno "Jméno původního plátce", vyplňte pole "Doplňující údaj"
  case ultimateDebtorInfoRequired = "UltimateDebtor:info:required"
  /// Název původního plátce
  case ultimateDebtorPlaceholder = "UltimateDebtor:placeholder"
  /// Původní plátce
  case ultimateDebtorTitle = "UltimateDebtor:title"
  /// Zadaná částka přesahuje maximální limit
  case validationAmountMaximumOver = "validation:amount maximum over"
  /// Zadaná částka není správná
  case validationAmountNotValid = "validation:amount not valid"
  /// Zvolená měna není platná
  case validationCurrencyNotValid = "validation:currency not valid"
  /// První 3 znaky musí být alfanumerické.
  case validationFirst3CharsAlphanum = "validation:first 3 chars:alphanum"
  /// První 3 znaky nesmí být stejné.
  case validationFirst3CharsDistinct = "validation:first 3 chars:distinct"
  /// Foreign account max
  case validationForeignAccountMax = "validation:foreign account max"
  /// Vložen nepovolený znak %1$@
  static func validationInvalidChar(_ string1: String) -> String {
    return self.tr("validation:invalid char", string1)
  }
  /// Vloženy nepovolené znaky %1$@
  static func validationInvalidChars(_ string1: String) -> String {
    return self.tr("validation:invalid chars", string1)
  }
  /// Uvedený znak na prvním místě je neplatný.
  case validationInvalidFirstChar = "validation:invalid first char"
  /// Byl překročen maximální počet znaků
  case validationInvalidLength = "validation:invalid length"
  /// Žádné účty nejsou k dispozici
  case validationNoAccounts = "validation:no accounts"
  /// Žádné účty nejsou k dispozici
  case validationNoPayeeAccount = "validation:no payee account"
  /// Účet příjemce není správný
  case validationPayeeAccountNumberNotValid = "validation:payee account number not valid"
  /// Kód banky příjemce není správný
  case validationPayeeBankNumberNotValid = "validation:payee bank number not valid"
  /// Zadaný IBAN není správný
  case validationPayeeIbanNotValid = "validation:payee iban not valid"
  /// Účet příjmce není správný
  case validationPayeeIncorrectInput = "validation:payee incorrect input"
  /// Účet plátce není správný
  case validationPayerAccountError = "validation:payer account error"
  /// Vybraný účet příjemce není platný
  case validationSelectedPayeeAccountNotValid = "validation:selected payee account not valid"
  /// Vybraný účet plátce není platný
  case validationSelectedPayerAccountNotValid = "validation:selected payer account not valid"
  /// Chybí datum splatnosti
  case validationValueDateMissingFromTo = "validation:value date missing from to"
  /// Zadaná částka nesmí být nulová
  case validationZeroAmount = "validation:zero amount"
  /// To account
  case accMyOwnS1To = "AccMyOwn.s1.to"
  /// Select
  case accMyOwnS2Select = "AccMyOwn.s2.select"
  /// To account
  case accPayeeS1To = "AccPayee.s1.to"
  /// From list
  case accPayeeS2Select = "AccPayee.s2.select"
  /// EU 0000 0000 0000 0000
  case accPayeeS3IbanPlaceholder = "AccPayee.s3.iban.placeholder"
  /// 000000
  case accPayeeS4PrefixPlaceholder = "AccPayee.s4.prefix.placeholder"
  /// 0123456789
  case accPayeeS5AboAccountNrPlaceholder = "AccPayee.s5.aboAccountNr.placeholder"
  /// BANK
  case accPayeeS6AboBankCodePlaceholder = "AccPayee.s6.aboBankCode.placeholder"
  /// From account
  case accPayerS1From = "AccPayer.s1.from"
  /// Select
  case accPayerS2Select = "AccPayer.s2.select"
  /// Amount
  case amountS1Title = "Amount.s1.title"
  /// 0.00
  case amountS2ValuePlaceholder = "Amount.s2.value.placeholder"
  /// Currency
  case amountS3CurrencyPlaceholder = "Amount.s3.currency.placeholder"
  /// BCP01.s1.title
  case bcp01S1Title = "BCP01.s1.title"
  /// BCP01.s2.screen.empty.header
  case bcp01S2ScreenEmptyHeader = "BCP01.s2.screen.empty.header"
  /// BCP01.s3.screen.empty.body
  case bcp01S3ScreenEmptyBody = "BCP01.s3.screen.empty.body"
  /// BCP01.s4.button.add.new
  case bcp01S4ButtonAddNew = "BCP01.s4.button.add.new"
  /// Close
  case commonC42ButtonClose = "common.c42.button.close"
  /// common.c48.scope.all
  case commonC48ScopeAll = "common.c48.scope.all"
  /// common.c49.scope.domestic
  case commonC49ScopeDomestic = "common.c49.scope.domestic"
  /// common.c50.scope.crossboarder
  case commonC50ScopeCrossboarder = "common.c50.scope.crossboarder"
  /// Start to use
  case commonC51ButtonStartToUse = "common.c51.button.start.to.use"
  /// Authorize
  case commonC52ButtonAuthorize = "common.c52.button.authorize"
  /// Save to Waiting room
  case commonC53ButtonStoreToFwr = "common.c53.button.store.to.fwr"
  /// Zadaný konstantní symbol není platný, opravte prosím zadání
  case conSymbolInvalid = "ConSymbol.invalid"
  /// Konstantní symbol
  case conSymbolTitle = "ConSymbol.title"
  /// 0000
  case conSymbolValuePlaceholder = "ConSymbol.value.placeholder"
  /// Upozornění
  case errorE5UnableToPasteHeader = "error.e5.unable.to.paste.header"
  /// Welcome in your new mobile banking for companies and corporations.
  case g01S0Text = "G01.s0.text"
  /// New ČSOB CEB Mobile
  case g01S0Title = "G01.s0.title"
  /// What’s new
  case g02S0Title = "G02.s0.title"
  /// Message Hint
  case msgPayeeHint = "MsgPayee.hint"
  /// Message to payee
  case msgPayeeTitle = "MsgPayee.title"
  /// Note to self
  case noteToSelfS1Title = "NoteToSelf.s1.title"
  /// Not public
  case noteToSelfS2ValuePlaceholder = "NoteToSelf.s2.value.placeholder"
  /// Priority flag
  case priorityFlagS1Title = "PriorityFlag.s1.title"
  /// PT01.common.all
  case pt01CommonAll = "PT01.common.all"
  /// Close
  case pt01CommonClose = "PT01.common.close"
  /// PT01.common.templates
  case pt01CommonTemplates = "PT01.common.templates"
  /// PT01.common.crossborder.templates
  case pt01CommonCrossborderTemplates = "PT01.common.crossborder.templates"
  /// PT01.common.domestic.templates
  case pt01CommonDomesticTemplates = "PT01.common.domestic.templates"
  /// PT01.common.mobile.notice
  case pt01CommonMobileNotice = "PT01.common.mobile.notice"
  /// PT01.no.templates
  case pt01NoTemplates = "PT01.no.templates"
  /// PT01.templates.add.new
  case pt01TemplatesAddNew = "PT01.templates.add.new"
  /// PT01.templates.notice.content
  case pt01TemplatesNoticeContent = "PT01.templates.notice.content"
  /// PT01.templates.type.crossborder
  case pt01TemplatesTypeCrossborder = "PT01.templates.type.crossborder"
  /// PT01.templates.type.domestic
  case pt01TemplatesTypeDomestic = "PT01.templates.type.domestic"
  /// PT01.templates.type.domesticFx
  case pt01TemplatesTypeDomesticFx = "PT01.templates.type.domesticFx"
  /// PT01.templates.type.sepa
  case pt01TemplatesTypeSepa = "PT01.templates.type.sepa"
  /// Purpose of payment hint
  case purposeHint = "Purpose.hint"
  /// Purpose of payment
  case purposeTitle = "Purpose.title"
  /// Zadání účelu pro zahraniční platební styk
  case purposeIntHint = "PurposeInt.hint"
  /// Účel platby
  case purposeIntTitle = "PurposeInt.title"
  /// Specifický symbol může obsahovat pouze číslice, opravte prosím zadání
  case specSymbolInvalid = "SpecSymbol.invalid"
  /// Specifický symbol
  case specSymbolTitle = "SpecSymbol.title"
  /// 0000000000
  case specSymbolValuePlaceholder = "SpecSymbol.value.placeholder"
  /// Current view doesn't contain any records.
  case transactionRecordsEmptyBody = "Transaction:records:empty.body"
  /// New transaction
  case trx00S1Title = "TRX00.s1.title"
  /// You cannot make crossborder payment.
  case trx00S10OtherForeignWhenNoRightsHeader = "TRX00.s10.other.foreign.when.no.rights.header"
  /// Still you can choose from other crossborder options.
  case trx00S11TryOtherForeignWhenNoRightsBody = "TRX00.s11.try.other.foreign.when.no.rights.body"
  /// Available options
  case trx00S12AvailableOptions = "TRX00.s12.available.options"
  /// Domestic Standing Order
  case trx00S13OptDomesticStanding = "TRX00.s13.opt.domestic.standing"
  /// Domestic Fx Order
  case trx00S14OptDomesticFx = "TRX00.s14.opt.domestic.fx"
  /// Transfer Btw Own Accounts
  case trx00S15OptTbca = "TRX00.s15.opt.tbca"
  /// You have no account for domestic payments.
  case trx00S16NoDomesticAccountsHeader = "TRX00.s16.no.domestic.accounts.header"
  /// Description of reasons for unavailable domestic payments.
  case trx00S17NoDomesticAccountsBody = "TRX00.s17.no.domestic.accounts.body"
  /// You have no account for crossborder payments.
  case trx00S18NoForeignAccountsHeader = "TRX00.s18.no.foreign.accounts.header"
  /// Description of reasons for unavailable crossborder payments.
  case trx00S19NoForeignAccountsBody = "TRX00.s19.no.foreign.accounts.body"
  /// Domestic payment
  case trx00S2ViewDomestic = "TRX00.s2.view.domestic"
  /// Domestic Order
  case trx00S20OptDomesticLocal = "TRX00.s20.opt.domestic.local"
  /// Sepa Order
  case trx00S21OptForeignSepa = "TRX00.s21.opt.foreign.sepa"
  /// Crossborder Order
  case trx00S22OptForeignCrossborder = "TRX00.s22.opt.foreign.crossborder"
  /// Crossborder payment
  case trx00S3ViewCrossborder = "TRX00.s3.view.crossborder"
  /// You cannot make domestic payments.
  case trx00S4NoDomesticPaymentsHeader = "TRX00.s4.no.domestic.payments.header"
  /// Description of reasons for unavailable domestic payments.
  case trx00S5NoDomesticPaymentsBody = "TRX00.s5.no.domestic.payments.body"
  /// You cannot make crossborder payments.
  case trx00S6NoCrossborderPaymentsHeader = "TRX00.s6.no.crossborder.payments.header"
  /// Description of reasons for unavailable crossborder payments.
  case trx00S7NoCrossborderPaymentsBody = "TRX00.s7.no.crossborder.payments.body"
  /// You cannot make domestic payment.
  case trx00S8TryOtherDomesticWhenNoRightsHeader = "TRX00.s8.try.other.domestic.when.no.rights.header"
  /// Still you can choose from other domestic options.
  case trx00S9TryOtherDomesticWhenNoRightsBody = "TRX00.s9.try.other.domestic.when.no.rights.body"
  /// Maturity
  case valueDateS1Title = "ValueDate.s1.title"
  /// Select
  case valueDateS2ValuePlaceholder = "ValueDate.s2.value.placeholder"
  /// Variabilní symbol může obsahovat pouze číslice, opravte prosím zadání
  case varSymbolInvalid = "VarSymbol.invalid"
  /// Variabilní symbol
  case varSymbolTitle = "VarSymbol.title"
  /// 0000000000
  case varSymbolValuePlaceholder = "VarSymbol.value.placeholder"
}

extension Localization: LocalizationTranslatable {}

extension Localization: CustomStringConvertible {
  var description: String { return self.string }

  var string: String { return Localization.tr(rawValue) }
}

typealias L = Localization

private final class LocalizationBundleToken {}
