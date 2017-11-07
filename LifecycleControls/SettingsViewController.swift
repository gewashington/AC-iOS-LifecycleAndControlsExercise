//
//  SettingsViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var switchIsOn: Bool = true {
        didSet {
            
        }
    }
    //You need an Outlet and Action for switch buttons
    @IBAction func switchAction(_ sender: UISwitch) {
        self.switchIsOn = sender.isOn
    }
    @IBOutlet weak var switchOutlet: UISwitch!
    
    //You need an Outlet and Action for a Stepper
    @IBOutlet weak var stepperOutlet: UIStepper!
    var stepperNumber: Double = 0 {
        didSet {
            //for number of rows
            if stepperNumber > stepperOutlet.maximumValue {
                stepperNumber = stepperOutlet.maximumValue
            }
            if stepperNumber < stepperOutlet.minimumValue {
                stepperNumber = stepperOutlet.minimumValue
            }
            numberOfRowsLabel.text = "Number of Rows: \(stepperNumber)"
            stepperOutlet.value = stepperNumber
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        //increase or decrease rows
        //change stepper text
        stepperNumber = sender.value
    }
    
    //You need an outlet and an Action for segmentedcontrol
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    var currentSegmentedIndex: Int = 1 {
        didSet {
            switch self.segmentedOutlet.titleForSegment(at: currentSegmentedIndex)! {
            case "lower":
                Settings.letterStyle = "lower"
            case "UPPER":
                Settings.letterStyle = "UPPER"
            case "Proper":
                Settings.letterStyle = "Proper"
            default:
                print("WHY YOU HERE?")
        }
    
        }
        
    }
    @IBAction func segmentedControllerAction(_ sender: UISegmentedControl) {
        currentSegmentedIndex = sender.selectedSegmentIndex
        
    }
    
    //You only need Actions for sliders
    @IBAction func sliderRed(_ sender: UISlider) {
        
    }
    @IBAction func sliderBlue(_ sender: UISlider) {
        
    }
    @IBAction func sliderGreen(_ sender: UISlider) {
        
    }
    
    //These are the labels and views
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var numberOfRowsLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchIsOn = switchOutlet.isOn
        stepperNumber = stepperOutlet.value
        // Do any additional setup after loading the view.
    }
    
}
