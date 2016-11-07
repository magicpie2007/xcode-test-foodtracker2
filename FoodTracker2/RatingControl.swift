//
//  RatingControl.swift
//  FoodTracker2
//
//  Created by 小路宏幸 on 2016/11/06.
//  Copyright © 2016年 hiroyuki.shoji. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialzation
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.blue
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
