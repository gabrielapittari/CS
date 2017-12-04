//
//  Score.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

public struct Score: Codable {
    
    enum Status: String, Codable {
        case PASS
        case FAIL
        case UNKNOWN
    }
    
    enum PersonalType: String, Codable {
        case EXPERIENCED
        case INEXPERIENCED
        case UNKNOWN
    }
    
    var accountIDVStatus: Status = .UNKNOWN
    var creditReportInfo: CreditReportInfo!
    var dashboardStatus: Status = .UNKNOWN
    var personalType: PersonalType = .UNKNOWN
    var coachingSummary: CoachingSummary!
    
}
