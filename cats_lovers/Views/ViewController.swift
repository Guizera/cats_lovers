//
//  ViewController.swift
//  cats_lovers
//
//  Created by José Alves da Cunha on 27/03/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet var backgroundview: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        gradientLayer.shouldRasterize = true

        backgroundview.layer.addSublayer(gradientLayer)
        
        backgroundview.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    
    @IBAction func enterNewScreenBtn(_ sender: Any) {
    }
    override var shouldAutorotate: Bool {
        
        return false
    }


}

