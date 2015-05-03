//
//  ViewController.swift
//  SlotMachine
//
//  Created by Alberto Garrido on 3/5/15.
//  Copyright (c) 2015 Alberto Garrido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Containers
    var firstContainer:         UIView!
    var secondContainer:        UIView!
    var thirdContainer:         UIView!
    var fourthContainer:        UIView!
    
    // title label
    var titleLabel:             UILabel!
    
    //Information labels
    var creditsLabel:           UILabel!
    var betLabel:               UILabel!
    var winnerPaidLabel:        UILabel!
    var creditsTitleLabel:      UILabel!
    var betTitleLabel:          UILabel!
    var winnerPaidTitleLabel:   UILabel!
    
    //Buttons 4th container
    var resetButton:            UIButton!
    var betOneButton:           UIButton!
    var betMaxButton:           UIButton!
    var spnButton:              UIButton!
    
    // Meassures
    let kMarginForView:         CGFloat = 10.0
    let kMarginForSlot:         CGFloat = 2.0
    let kHalf:                  CGFloat = 1.0/2.0
    let kThird:                 CGFloat = 1.0/3.0
    let kSixth:                 CGFloat = 1.0/6.0
    let kEighth:                CGFloat = 1.0/8.0
    
    //Slots
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerViews()
        setupFirstContainer(containerView: self.firstContainer)
        setupSecondContainer(containerView: self.secondContainer)
        setupThirdContainer(containerView: self.thirdContainer)
        setupFourthContainer(containerView: self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions
    func resetButtonPresssed(button: UIButton) {
        println("RESET BUTTON PRESSED")
    }
    
    // SETUP COMPONENTS
    func setupContainerViews() {
        
        let bounds = self.view.bounds;
        
        self.firstContainer = UIView(
            frame: CGRect(
                x:      bounds.origin.x + kMarginForView,
                y:      bounds.origin.y,
                width:  bounds.width - (kMarginForView * 2),
                height: bounds.height * kSixth
            )
        );
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(
            frame: CGRect(
                x:      bounds.origin.x + kMarginForView,
                y:      firstContainer.frame.height,
                width:  bounds.width - (kMarginForView * 2),
                height: bounds.height * (3 * kSixth)
            )
        );
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(
            frame: CGRect(
                x:      bounds.origin.x + kMarginForView,
                y:      firstContainer.frame.height + secondContainer.frame.height,
                width:  bounds.width - (kMarginForView * 2),
                height: bounds.height * kSixth
            )
        );
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(
            frame: CGRect(
                x:      bounds.origin.x + kMarginForView,
                y:      firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                width:  bounds.width - (kMarginForView * 2),
                height: bounds.height * kSixth
            )
        );
        self.view.addSubview(self.fourthContainer)
        
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.fourthContainer.backgroundColor = UIColor.blackColor()
    }
    
    func setupFirstContainer(#containerView: UIView) {
        self.titleLabel             = UILabel()
        self.titleLabel.text        = "Super Slots"
        self.titleLabel.textColor   = UIColor.yellowColor()
        self.titleLabel.font        = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center      = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(#containerView: UIView){
        
        for(var containerNumber = 0; containerNumber < self.kNumberOfContainers; ++containerNumber){
            for(var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber){
                
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame =  CGRect(
                    x:      containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y:      containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                    width:  containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot
                );
                containerView.addSubview(slotImageView)
                
            }
        }
        
    }
    func setupThirdContainer(#containerView: UIView){
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kSixth
        );
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kSixth
        );
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kSixth
        );
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird * 2
        );
        self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
        self.creditsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird * 2
        );
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        self.betTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kThird * 2
        );
        self.winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupFourthContainer(#containerView: UIView){
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size:12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(
            x: containerView.frame.width * kEighth,
            y: containerView.frame.height * kHalf
        );
        self.resetButton.addTarget(
            self,
            action: "resetButtonPresssed:",
            forControlEvents: UIControlEvents.TouchUpInside
        );
        containerView.addSubview(self.resetButton)
        
        
        /*
        var betOneButton:           UIButton!
        var betMaxButton:           UIButton!
        var spnButton:              UIButton!
        */
    }
}

