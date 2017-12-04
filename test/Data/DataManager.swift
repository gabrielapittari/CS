//
//  DataManager.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

import Foundation

public enum DataManagerErrorType {
    case noConnection
    case dataError
    case unknown
    case noError
}

public protocol DataManagerDelegate: class {
    func transactionResult<T>(_ result: T)
    func transactionError(_ error: DataManagerErrorType)
}

public class DataManager: NSObject {
    static let sharedInstance = DataManager()
    weak var delegate: DataManagerDelegate!
    
    func getCreditScoreData() {
        let creditReportInfoURLString = "\(BundleReader().valueForBaseURL())/interview_test/creditReportInfo.json"
        let creditReportInfoURL = URL(string: creditReportInfoURLString)
        URLSession.shared.dataTask(with: creditReportInfoURL!) { (responseData, _, _) in
            if let data = responseData {
                let jsonString = String(data: data, encoding: .utf8)
                let jsonData = jsonString?.data(using: .utf8)!
                let decoder = JSONDecoder()
                let score = try! decoder.decode(Score.self, from: jsonData!)
                self.delegate?.transactionResult(score)
            }
            }.resume()
    }
}
