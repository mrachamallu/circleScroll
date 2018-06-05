//
//  ViewController.swift
//  circleScroll
//
//  Created by Meera Rachamallu on 6/2/18.
//  Copyright © 2018 meera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer() //made this global so handleTap can access it
    var counter = 0;
    
    let numberTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        textView.text = "0"
        textView.font = UIFont.boldSystemFont(ofSize: 80)
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view, typically from a nib.
    
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        //track layer
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.darkGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.lineCap = kCALineCapRound
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        //animated layer
        let numberPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: true)
        shapeLayer.path = numberPath.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        //adding the numbers
        view.addSubview(numberTextView)
        setupLayout()
        
    }

    @objc private func handleTap(){
        print("Attempting to animate stroke")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        //counter
        //counter = 0;
        var _ = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    @objc func update() {
        if(counter < 75) {
            counter = counter + 1;
            numberTextView.text = String(counter)
        }
    }

    //programmatically add constraints
    private func setupLayout() {
        numberTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberTextView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

