//
//  SettingsViewController.swift
//  JTip
//
//  Created by Jamie Tsao on 12/22/14.
//  Copyright (c) 2014 Jamie Tsao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var defaultPartySizeControl: UISegmentedControl!
    @IBOutlet weak var roundUpPartyAmountSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTipPercentageChange(sender: AnyObject) {
        // get default tip % from slider
        let defaultTipPercentage = Int(defaultTipSlider.value)

        // update label
        defaultTipLabel.text = String(format: "%d%%", defaultTipPercentage)
        
        // save to user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentage, forKey: "defaultTipPercentage")
        defaults.synchronize()
    }
    
    @IBAction func onPartySizeChange(sender: AnyObject) {
        // get default party size
        let defaultPartySize = defaultPartySizeControl.selectedSegmentIndex + 1
        
        // save to user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultPartySize, forKey: "defaultPartySize")
        defaults.synchronize()
    }
    
    @IBAction func onRoundUpChange(sender: AnyObject) {
        
        // get round up setting
        let round = roundUpPartyAmountSwitch.on
        
        // save to user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(round, forKey: "defaultRoundPartyAmount")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // get saved defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentage = defaults.integerForKey("defaultTipPercentage")
        let defaultPartySize = defaults.integerForKey("defaultPartySize")
        let defaultRound = defaults.boolForKey("defaultRoundPartyAmount")

        // init controls & labels
        defaultTipSlider.value = Float(defaultTipPercentage)
        defaultTipLabel.text = String(format: "%d%%", defaultTipPercentage)
        defaultPartySizeControl.selectedSegmentIndex = defaultPartySize - 1;
        roundUpPartyAmountSwitch.on = defaultRound
    }

}
