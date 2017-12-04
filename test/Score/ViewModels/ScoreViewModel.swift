//
//  ScoreViewModel.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//
import Foundation

final class ScoreViewModel: ScoreViewModelType, DataManagerDelegate {
    
    var score: Score!
    
    init() {
        let dataManager = DataManager()
        dataManager.delegate = self
        dataManager.getCreditScoreData()
    }
    
    func transactionResult<T>(_ result: T) {
        score = result as! Score
    }
    
    func transactionError(_ error: DataManagerErrorType) {
        print("transactionError")
    }
}
