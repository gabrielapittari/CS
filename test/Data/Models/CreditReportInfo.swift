//
//  CreditReportInfo.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

public struct CreditReportInfo: Codable {

    enum CreditStatus: String, Codable {
        case MATCH
        case UNMATCH
        case UNKNOWN
    }
    
    var score: Int = 0
    var scoreBand: Int = 0
    var clientRef: String = ""
    var status: CreditStatus = .UNKNOWN
    var maxScoreValue: Int = 0
    var minScoreValue: Int = 0
    var monthsSinceLastDefaulted: Int = 0
    var hasEverDefaulted: Bool = false
    var monthsSinceLastDelinquent: Int = 0
    var hasEverBeenDelinquent: Bool = false
    var percentageCreditUsed: Int = 0
    var percentageCreditUsedDirectionFlag: Int = 0
    var changedScore: Int = 0
    var currentShortTermDebt: Int = 0
    var currentShortTermNonPromotionalDebt: Int = 0
    var currentShortTermCreditLimit: Int = 0
    var currentShortTermCreditUtilisation: Int = 0
    var changeInShortTermDebt: Int = 0
    var currentLongTermDebt: Int = 0
//    var currentLongTermNonPromotionalDebt: Int = 0
//    var currentLongTermCreditLimit: Int = 0
//    var currentLongTermCreditUtilisation: Int = 0
    var changeInLongTermDebt: Int = 0
    var numPositiveScoreFactors: Int = 0
    var numNegativeScoreFactors: Int = 0
    var equifaxScoreBand: Int = 0
    var equifaxScoreBandDescription: String = ""
    var daysUntilNextReport: Int = 0
    
}
