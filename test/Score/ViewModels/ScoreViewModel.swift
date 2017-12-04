//
//  ScoreViewModel.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//
import Foundation

protocol ScoreViewModelDelegate: class {
    func scoreResultSuccess()
    func scoreResultError(_ error: DataManagerErrorType)
}

final class ScoreViewModel: DataManagerDelegate {
    
    weak var delegate: ScoreViewModelDelegate!
    
    var scoreValue: Int = 0
    var maxScoreValue: Int = 0
    
    init() {
        let dataManager = DataManager()
        dataManager.delegate = self
        dataManager.getCreditScoreData()
    }
    
    func transactionResult<T>(_ result: T) {
        let score = result as! Score
        maxScoreValue = score.creditReportInfo.maxScoreValue
        scoreValue = score.creditReportInfo.score
        self.delegate?.scoreResultSuccess()
    }
    
    func transactionError(_ error: DataManagerErrorType) {
        self.delegate?.scoreResultError(error)
    }
}
