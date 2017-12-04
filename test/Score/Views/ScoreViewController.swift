//
//  ScoreViewController.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, ScoreViewModelDelegate {
    
    let errorString = "Error"
    let okString = "Ok"
    
    @IBOutlet weak var scoreView: ScoreView!
    var viewModel: ScoreViewModel!
    
    convenience init(viewModel: ScoreViewModel) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dashboard"
        setScore()
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: okString, style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    func scoreResultSuccess() {
        setScore()
    }
    
    func setScore() {
        scoreView?.setScore(score: viewModel.scoreValue, maxScore: viewModel.maxScoreValue)
    }
    
    func scoreResultError(_ error: DataManagerErrorType) {
        showAlert(errorString, message: error.rawValue)
    }
    
}

