//
//  ViewController.swift
//  excersice2
//
//  Created by Héctor Cuevas Morfín on 6/1/16.
//  Copyright © 2016 Swanros. All rights reserved.
//

import UIKit

private extension Selector {
    static let buttonTaped = #selector(ViewController.buttonTapped(_:))
}
class ViewController: UIViewController,MyProtocol,UITableViewDelegate,UITableViewDataSource{
    var valueSentFromSecondViewController:String?
    var arrayWithBandNames:NSMutableArray? = NSMutableArray()
    private lazy var buttonAdd: UIButton = {
        let i = UIButton()
       // i.setImage(UIImage(named: "lemon"), forState: .Normal)
        i.setTitle("Add", forState: .Normal)
        i.setTitleColor(.blueColor(), forState: .Normal)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.addTarget(self, action: .buttonTaped, forControlEvents: UIControlEvents.TouchUpInside)
        return i
    }()
    
    private lazy var tableView: UITableView =
        {
            let table = UITableView()
            table.dataSource = self
            table.delegate = self
            table.translatesAutoresizingMaskIntoConstraints = false
            return table
            
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        view.addSubview(buttonAdd)
        view.addSubview(tableView)
        makeConstraints()
        if let array = NSUserDefaults.standardUserDefaults().objectForKey("arrayWithBands") as? NSArray {
            
            arrayWithBandNames = array.mutableCopy() as? NSMutableArray
        }

                 // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeConstraints() {
        let margin = view.layoutMarginsGuide
        buttonAdd.topAnchor.constraintEqualToAnchor(margin.topAnchor, constant:10).active = true
        buttonAdd.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor, constant: -5).active = true
        buttonAdd.widthAnchor.constraintEqualToConstant(50).active = true
        buttonAdd.heightAnchor.constraintEqualToConstant(50).active = true
        tableView.topAnchor.constraintEqualToAnchor(margin.topAnchor, constant: 90).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(margin.bottomAnchor, constant: 0).active = true
        tableView.leadingAnchor.constraintEqualToAnchor(margin.leadingAnchor, constant:  0).active = true
        tableView.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor, constant: 0).active = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func sendBandsName(string:String) {
        //DO YOUR THING
        valueSentFromSecondViewController = string
        arrayWithBandNames?.addObject(string)
        NSUserDefaults.standardUserDefaults().removeObjectForKey("arrayWithBands")
        NSUserDefaults.standardUserDefaults().setObject(arrayWithBandNames, forKey: "arrayWithBands")
        tableView.reloadData()
    }
    func buttonTapped(button: UIButton) {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayWithBandNames?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell:UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        myCell.textLabel?.text = arrayWithBandNames?.objectAtIndex(indexPath.row) as? String
        
        return myCell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print(arrayWithBandNames)
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrayWithBandNames?.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
           NSUserDefaults.standardUserDefaults().setObject(arrayWithBandNames, forKey: "arrayWithBands")
        }
    }

}

