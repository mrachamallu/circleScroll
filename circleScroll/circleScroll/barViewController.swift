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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rectPath1 = UIBezierPath(rect: CGRect(x: 64, y: 64, width: 160, height: 160))
        firstShape.path = rectPath1.cgPath
        firstShape.fillColor = UIColor.purple.cgColor
        
        view.layer.addSublayer(firstShape)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap() {
        print("Attempt to grow bar graph")
        let basicAnimation = CABasicAnimation(keyPath: "yayMe")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = kCAFillModeForwards
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
