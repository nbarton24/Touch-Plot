//
//  ViewController.swift
//  TouchLocations
//
//  Created by Nick Barton on 10/5/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tf:Bool = false
    
    @IBOutlet weak var plotView: TappableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(sender: AnyObject) {
        
        plotView.clearPoints()
        
    }
}

