//
//  barViewController.swift
//  circleScroll
//
//  Created by Meera Rachamallu on 6/4/18.
//  Copyright © 2018 meera. All rights reserved.
//

import UIKit

class barViewController: UIViewController {

    let firstShape = CAShapeLayer()
    let secondShape = CAShapeLayer()
    let thirdShape = CAShapeLayer()
    let bars = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //first bar
        let rectPath1 = UIBezierPath(rect: CGRect(x: 86, y: 300, width: 64, height: 160))
        firstShape.path = rectPath1.cgPath
        firstShape.fillColor = UIColor.purple.cgColor
        
        //second bar
        let rectPath2 = UIBezierPath(rect: CGRect(x: 156, y: 300, width: 64, height: 160))
        secondShape.path = rectPath2.cgPath
        secondShape.fillColor = UIColor.cyan.cgColor
        
        //third bar
        let rectPath3 = UIBezierPath(rect: CGRect(x: 226, y: 300, width: 64, height: 160))
        thirdShape.path = rectPath3.cgPath
        thirdShape.fillColor = UIColor.orange.cgColor
        
        //add layers
        view.layer.addSublayer(firstShape)
        view.layer.addSublayer(secondShape)
        view.layer.addSublayer(thirdShape)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap() {
        print("Attempt to grow bar graph")
        let basicAnimation = CABasicAnimation(keyPath: "yayMe")
        basicAnimation.fromValue = [NSValue(cgSize: CGSize(width: self.firstShape.frame.size.width, height: self.firstShape.frame.size.height))]
        basicAnimation.toValue = [NSValue(cgSize: CGSize(width: self.firstShape.frame.size.width, height: 200.0))]
        basicAnimation.duration = 1.5
        //basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        firstShape.add(basicAnimation, forKey: "urSoBasic")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
