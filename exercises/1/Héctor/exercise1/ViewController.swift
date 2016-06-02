//
//  ViewController.swift
//  exercise1
//
//  Created by Héctor Cuevas Morfín on 5/31/16.
//  Copyright © 2016 Swanros. All rights reserved.
//
import UIKit

private extension Selector {
    static let buttonTaped = #selector(ViewController.buttonClicked(_:))
}
class ViewController: UIViewController {
    private lazy var myImageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = UIImage(named: "lemons.jpg")
        i.contentMode = .ScaleAspectFill
        return i
    }()
    private lazy var buttonLemon: UIButton = {
        let i = UIButton()
        i.setImage(UIImage(named: "lemon"), forState: .Normal)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.addTarget(self, action: .buttonTaped, forControlEvents: UIControlEvents.TouchUpInside)
        return i
    }()
    
    private lazy var buttonBuild: UIButton = {
        let i = UIButton()
        i.setImage(UIImage(named: "build"), forState: .Normal)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.addTarget(self, action: .buttonTaped, forControlEvents: UIControlEvents.TouchUpInside)
        return i
    }()
    let imageViewToDisplay = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(myImageView)
        self.view .addSubview(buttonBuild)
        self.view .addSubview(buttonLemon)
        doMakeConstraints()

    }

    func doMakeConstraints()  {
        let margins = view.layoutMarginsGuide
        buttonLemon.widthAnchor.constraintEqualToConstant(40.0).active = true
        buttonLemon.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -30).active = true
        buttonLemon.leftAnchor.constraintEqualToAnchor(margins.leftAnchor,constant: 30).active = true
        buttonBuild.widthAnchor.constraintEqualToConstant(40.0).active = true
        buttonBuild.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -30).active = true
        buttonBuild.rightAnchor.constraintEqualToAnchor(margins.rightAnchor, constant: -30).active = true
        myImageView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor,constant: 0).active = true
        myImageView.topAnchor.constraintEqualToAnchor(margins.topAnchor,constant: 0).active = true
        myImageView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor,constant: 0).active = true
        myImageView.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor,constant: -100).active = true
    }

    func buttonClicked(button: UIButton){
        if button == buttonBuild
        {
            myImageView.image = UIImage(named: "builds.jpg")
        }else
        {
            myImageView.image = UIImage(named: "lemons.jpg")
        }
    }

}


