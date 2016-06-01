//
//  ViewController.swift
//  exercise1
//
//  Created by Héctor Cuevas Morfín on 5/31/16.
//  Copyright © 2016 Swanros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageViewToDisplay = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        doCreateView()
        imageViewToDisplay.image = UIImage(named: "lemons.jpg")
        imageViewToDisplay.contentMode = .ScaleAspectFill
        imageViewToDisplay.translatesAutoresizingMaskIntoConstraints = false
        //imageViewToDisplay.frame = CGRectMake(0, 0, 100, 100)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func doCreateView()  {
        self.view.addSubview(imageViewToDisplay)
        let buttonLemon = UIButton()
        buttonLemon.tag = 1
        let buttonBuild = UIButton()
        buttonBuild.tag = 2
        buttonLemon.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBuild.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        buttonLemon.setImage(UIImage(named: "lemon"), forState: .Normal)
        buttonBuild.setImage(UIImage(named: "build"), forState: .Normal)
        buttonLemon.translatesAutoresizingMaskIntoConstraints = false
        buttonBuild.translatesAutoresizingMaskIntoConstraints = false
        self.view .addSubview(buttonBuild)
        self.view .addSubview(buttonLemon)
        
        let widthConsLemon = NSLayoutConstraint(
            item: buttonLemon,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 40)

        let bottomConsLemon = NSLayoutConstraint(
            item: buttonLemon,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1, constant: -30)
        
        let leftConsLemon = NSLayoutConstraint(
            item: buttonLemon,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1, constant:  30);
        
       let widthConsBuild = NSLayoutConstraint(
            item: buttonBuild,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 40)

        let bottomConsBuild = NSLayoutConstraint(
            item: buttonBuild,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1, constant: -30)
        
        
        let rightConsBuild = NSLayoutConstraint(
            item: buttonBuild,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Right,
            multiplier: 1, constant: -30);
        
        
        let widthConsImage = NSLayoutConstraint(
            item: imageViewToDisplay,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: self.view.frame.size.width)
        
        let bottomConsImage = NSLayoutConstraint(
            item: imageViewToDisplay,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1,
            constant: -100)
        
        let topConsImage = NSLayoutConstraint(
            item: imageViewToDisplay,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1, constant: 0)
        
        let leftConsImage = NSLayoutConstraint(
            item: imageViewToDisplay,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1, constant:  0);

        self.view.addConstraints([leftConsImage,topConsImage,widthConsImage,bottomConsImage, widthConsBuild,bottomConsBuild,rightConsBuild,bottomConsLemon, leftConsLemon,widthConsLemon])
    }

    func buttonClicked(button: UIButton){
        
        if button.tag == 2
        {
            imageViewToDisplay.image = UIImage(named: "builds.jpg")
        }else
        {
            imageViewToDisplay.image = UIImage(named: "lemons.jpg")
        }
    }

}

