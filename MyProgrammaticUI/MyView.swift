//
//  MyView.swift
//  MyProgrammaticUI
//
//  Created by Aditya Narayan on 2/23/17.
//
//

import Foundation
import UIKit

class MyView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.green
        self.alpha = 0.7
        self.layer.cornerRadius = 5
        //self.layer.shadowColor
        self.layer.shadowOffset = CGSize.init(width: 5.0, height: 5.0)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
