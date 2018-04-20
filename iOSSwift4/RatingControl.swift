//
//  RatingControl.swift
//  iOSSwift4
//
//  Created by Xurpas Enterprise on 20/04/2018.
//  Copyright © 2018 Xurpas Enterprise. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: <#T##CGRect#>)
        setupButtons()
    }
    
    // This reqiired in impleted by UIStackView
    required init(coder: NSCoder) {
        setupButtons()
    }
    
    // MARK: Private methods.
    private func setupButtons() {
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
   
}
