//
//  ScoreView.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    var view: UIView!
    let nibName: String = "ScoreView"
    let yourCreditScoreString = "Your credit score is"
    let outOfString = "out of"
    let lineWidth = CGFloat(3.0)
    
    let arcLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    var score: Int = 0
    var maxScore: Int = 0
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let views = nib.instantiate(withOwner: self, options:nil) as! [UIView]
        let view = views[0] as UIView
        return view
    }
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(view)
        
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(gradientLayer)
        
        resultLabel.text = yourCreditScoreString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupArc()
        setupValues()
    }
    
    func setupArc() {
        let point = CGPoint(x: frame.height / 2, y: frame.height / 2)
        let path: CGPath = UIBezierPath.init(arcCenter: point, radius: frame.height / 2, startAngle: CGFloat(0), endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        shapeLayer.path = path
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
    func setupValues() {
        valueLabel.text = "\(score)"
        totalLabel.text = "\(outOfString) \(maxScore)"
        setupGradientArc(endPercentage: CGFloat(score) / CGFloat(maxScore))
    }
    
    func setScore(score: Int, maxScore: Int) {
        self.score = score
        self.maxScore = maxScore
    }
    
    func getColors(endPercentage: CGFloat) -> [CGColor] {
        if endPercentage < 0.25 {
            return [UIColor.orange.cgColor]
        } else if endPercentage >= 0.25 && endPercentage < 0.5 {
            return [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        } else {
            return [UIColor.green.cgColor, UIColor.orange.cgColor]
        }
    }
    
    func setupGradientArc(endPercentage: CGFloat) {
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.colors = getColors(endPercentage: endPercentage)
        
        let point = CGPoint(x: frame.height / 2, y: frame.height / 2)
        
        let startAngle = 3 * CGFloat.pi / 2
        let endAngle = 3 * CGFloat.pi / 2 * endPercentage
        
        let arcPath: CGPath = UIBezierPath.init(arcCenter: point, radius: (frame.height - 4 * lineWidth) / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
        arcLayer.path = arcPath
        arcLayer.strokeColor = UIColor.black.cgColor
        arcLayer.lineWidth = lineWidth
        arcLayer.fillColor = UIColor.clear.cgColor
        gradientLayer.mask = arcLayer
        
        valueLabel.textColor = UIColor(cgColor: getColors(endPercentage: endPercentage)[0])
    }
    //        let animation = CABasicAnimation(keyPath: "strokeEnd")
    //        animation.duration = 10.0
    //        animation.fromValue = 0
    //        animation.toValue = 1
    //        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    //        shapeLayer.strokeEnd = 1.0
    //        shapeLayer.add(animation, forKey: "animateCircle")
    //
    //        circleView.animateCircle(1.0)
}

