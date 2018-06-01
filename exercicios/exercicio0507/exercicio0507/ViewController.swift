//
//  ViewController.swift
//  exercicio0507
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let locale = Locale(identifier: "pt_BR")


        if let timezone = TimeZone(abbreviation: "EEST") {
            print("\(timezone.identifier)")
        }

        // Get current date
        let dateA = Date()


        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        let dateStr = formatter.string(from: dateA)
        print("1. \(dateStr)")


        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = locale

        // Get a later date (after a couple of milliseconds)
        let dateB = Date()

        // Compare them
        switch dateA.compare(dateB) {
            case .orderedAscending     :   print("Date A is earlier than date B")
            case .orderedDescending    :   print("Date A is later than date B")
            case .orderedSame          :   print("The two dates are the same")
        }


        let dateComponents = calendar.dateComponents([.day, .month, .year], from: dateA)
        let monthName = calendar.monthSymbols[dateComponents.month! - 1]
        print ("2. \(dateComponents.day!) \(monthName) \(dateComponents.year!)")

        if let componentsBasedDate = calendar.date(from: dateComponents) {
            let componentsBasedDateStr = formatter.string(from: componentsBasedDate)
            print("3. \(componentsBasedDateStr)")
        }


        print("Locale.availableIdentifiers: \(Locale.availableIdentifiers)")
        print("Locale.isoRegionCodes: \(Locale.isoRegionCodes)")
        print("Locale.isoCurrencyCodes: \(Locale.isoCurrencyCodes)")
        print("Locale.isoLanguageCodes: \(Locale.isoLanguageCodes)")
        print("Locale.commonISOCurrencyCodes: \(Locale.commonISOCurrencyCodes)")

        print("Locale.current.regionCode: \(Locale.current.regionCode )")          // "US"
        print("Locale.current.languageCode: \(Locale.current.languageCode  )")       // "en"
        print("Locale.current.currencyCode: \(Locale.current.currencyCode )")        // "USD"
        print("Locale.current.currencySymbol: \(Locale.current.currencySymbol )")      // "$"
        print("Locale.current.groupingSeparator: \(Locale.current.groupingSeparator )")   // ","
        print("Locale.current.decimalSeparator: \(Locale.current.decimalSeparator)")     // "."
        print("Locale.current.usesMetricSystem: \(Locale.current.usesMetricSystem )")    // false

        print("Locale.windowsLocaleCode(fromIdentifier: \"pt_BR\"): \(Locale.windowsLocaleCode(fromIdentifier: "pt_BR")) " ) //  1,046
        print("Locale.identifier(fromWindowsLocaleCode: 1046) ?? \"\": \(Locale.identifier(fromWindowsLocaleCode: 1046) ?? "") " ) // "pt_BR"
        print("Locale.windowsLocaleCode(fromIdentifier: Locale.current.identifier) : \(Locale.windowsLocaleCode(fromIdentifier: Locale.current.identifier) ) " ) //  1,033
        print("Locale.windowsLocaleCode(fromIdentifier: \"en_US\"): \(Locale.windowsLocaleCode(fromIdentifier: "en_US")) " ) // 1,033
        print("Locale.identifier(fromWindowsLocaleCode: 1033) ?? \"\": \(Locale.identifier(fromWindowsLocaleCode: 1033) ?? "") " ) // "en_US"

        print("Locale(identifier: \"en_US_POSIX\").localizedString(forLanguageCode: \"pt\"): \(Locale(identifier: "en_US_POSIX").localizedString(forLanguageCode: "pt")) " ) // "Portuguese"
        print("Locale(identifier: \"en_US_POSIX\").localizedString(forRegionCode: \"br\"): \(Locale(identifier: "en_US_POSIX").localizedString(forRegionCode: "br")) " ) // "Brazil"
        print("Locale(identifier: \"en_US_POSIX\").localizedString(forIdentifier: \"pt_BR\"): \(Locale(identifier: "en_US_POSIX").localizedString(forIdentifier: "pt_BR")) " ) // "Portuguese (Brazil)"

        print("TimeZone.current.localizedName(for: .standard, locale: .current) : \(TimeZone.current.localizedName(for: .standard, locale: .current) ?? "") " ) // "Brasilia Standard Time"
        print("TimeZone.current.localizedName(for: .shortStandard, locale: .current) : \(TimeZone.current.localizedName(for: .shortStandard, locale: .current) ?? "") " ) // "GMT-3
        print("TimeZone.current.localizedName(for: .daylightSaving, locale: .current) : \(TimeZone.current.localizedName(for: .daylightSaving, locale: .current) ?? "") " ) // "Brasilia Summer Time"
        print("TimeZone.current.localizedName(for: .shortDaylightSaving, locale: .current) : \(TimeZone.current.localizedName(for: .shortDaylightSaving, locale: .current) ?? "") " ) // "GMT-2"
        print("TimeZone.current.localizedName(for: .generic, locale: .current) : \(TimeZone.current.localizedName(for: .generic, locale: .current) ?? "") " ) // "Brasilia Time"
        print("TimeZone.current.localizedName(for: .shortGeneric, locale: .current) : \(TimeZone.current.localizedName(for: .shortGeneric, locale: .current) ?? "") " ) // "Sao Paulo Time"

        var timeZone: String {
            return TimeZone.current.localizedName(for: TimeZone.current.isDaylightSavingTime() ?
                .daylightSaving :
                .standard,
                                                  locale: .current) ?? "" }

        timeZone       // "Brasilia Summer Time"


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

