//
//  SecondViewController.swift
//  excersice2
//
//  Created by Héctor Cuevas Morfín on 6/1/16.
//  Copyright © 2016 Swanros. All rights reserved.
//

import UIKit


private extension Selector {
    static let buttonTaped = #selector(AddBandViewController.buttonTapped(_:))
}
protocol AddBandDelegate: class
{
    func sendBandsName(myString: String)
}

class AddBandViewController: UIViewController,UITextFieldDelegate,UIAlertViewDelegate {
    var delegate:AddBandDelegate?
    private lazy var buttonAdd: UIButton = {
        let i = UIButton()
        i.setTitle("save", forState: .Normal)
        i.setTitleColor(.blueColor(), forState: .Normal)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.addTarget(self, action: .buttonTaped, forControlEvents: UIControlEvents.TouchUpInside)
        return i
    }()
    
    private lazy var buttonCancel: UIButton = {
        let i = UIButton()
        i.setTitle("cancel", forState: .Normal)
        i.setTitleColor(.blueColor(), forState: .Normal)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.addTarget(self, action: .buttonTaped, forControlEvents: UIControlEvents.TouchUpInside)
        return i
    }()
    
    private lazy var textFieldBand: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .whiteColor()
        textField.placeholder = "Add Band's name"
        textField.textAlignment = .Center
        textField.returnKeyType = .Done
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        view.addSubview(buttonAdd)
        view.addSubview(buttonCancel)
        view.addSubview(textFieldBand)
        makeConstraints()
        //Do any additional setup after loading the view.
    }
    
    func makeConstraints() {
        let margin = view.layoutMarginsGuide
        
        buttonAdd.topAnchor.constraintEqualToAnchor(margin.topAnchor, constant:40).active = true
        buttonAdd.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor, constant: -5).active = true
        
        buttonCancel.topAnchor.constraintEqualToAnchor(margin.topAnchor, constant:40).active = true
        buttonCancel.leadingAnchor.constraintEqualToAnchor(margin.leadingAnchor, constant: 5).active = true
        
        textFieldBand.widthAnchor.constraintEqualToConstant(200).active = true
        textFieldBand.heightAnchor.constraintEqualToConstant(60).active = true
        textFieldBand.topAnchor.constraintEqualToAnchor(margin.topAnchor,constant: 100).active = true
        textFieldBand.centerXAnchor.constraintEqualToAnchor(margin.centerXAnchor).active = true
    }
    override func viewDidAppear(animated: Bool) {
        textFieldBand .becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonTapped(button: UIButton) {
        
        switch button {
        case buttonAdd:
            if textFieldBand.text?.isEmpty == true{
                UIAlertView(title:"Menssage", message: "Add a Band's Name", delegate: self, cancelButtonTitle: "Ok").show()
                
            }else{
                delegate?.sendBandsName(textFieldBand.text!)
                textFieldBand.resignFirstResponder()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            break
        default:
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.sendBandsName(textField.text!)
        textField.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
        return true
    }
    
}
