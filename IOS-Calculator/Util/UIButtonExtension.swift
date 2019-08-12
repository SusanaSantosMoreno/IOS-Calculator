//
//  UIButtonExtension.swift
//  IOS-Calculator
//
//  Created by Susana Santos Moreno on 23/06/2019.
//  Copyright © 2019 Susana Santos Moreno. All rights reserved.
//

import UIKit

extension UIButton {

    
    // Round borders
    func round(){
        layer.cornerRadius = bounds.height/2
        clipsToBounds = true;
    }
    
    // Shine animation
    func shine(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }){ (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
            
        }
    }
    
}
