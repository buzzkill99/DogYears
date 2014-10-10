//
//  ViewController.swift
//  DogYears
//
//  Created by sjbevan on 10/9/14.
//  Copyright (c) 2014 Buzzkill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dogAgeLabel: UILabel!
    @IBOutlet weak var yearsEntered: UITextField!
    @IBOutlet weak var monthsEntered: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateButtonTapped(sender: UIButton) {
      // Constants
      let DogFactor = 7.0
      let MonthsInYear = 12.0
      
      // Grab entered values, convert to doubles for calcs
      var humanYears = Double((yearsEntered.text as NSString).doubleValue)
      var humanMonths = Double((monthsEntered.text as NSString).doubleValue)
      var humanMonthsRem = 0.0
        
      // Make sure we have good values
      humanYears = (humanYears < 0.0) ? 0.0 : humanYears
      humanMonths = (humanMonths < 0.0) ? 0.0 : humanMonths
      
      // Take care of months
      if humanMonths > MonthsInYear {
        humanYears = humanYears + Double(Int(humanMonths / MonthsInYear))
        humanMonthsRem = humanMonths % MonthsInYear
        if humanMonthsRem > 0.0 {
          humanYears = humanYears + (humanMonthsRem / MonthsInYear)
        }
      } else if humanMonths != 0.0 {
          humanYears = humanYears + (humanMonths / MonthsInYear)
      }
        
      // Calculate & format
      var dogAge = (humanYears * DogFactor)
      let DogAgeString = NSString(format: "%.2f", dogAge)

      // Update label with result
      dogAgeLabel.textColor = UIColor.blueColor()
      dogAgeLabel.text = "Your general age in dog time is\n\(DogAgeString) years!"
        
      // Hide keypad
      yearsEntered.resignFirstResponder()
      monthsEntered.resignFirstResponder()
  }

  @IBAction func calculateButtonActualTapped(sender: UIButton) {
    // Constants for dog calculations
    let DogFactorBaby = 10.5
    let DogFactorAdult = 4.0
    let DogTurnsAdult = 2.0
    let MonthsInYear = 12.0
    
    // Grab entered values, convert to doubles for calcs
    var humanYears = Double((yearsEntered.text as NSString).doubleValue)
    var humanMonths = Double((monthsEntered.text as NSString).doubleValue)
    var humanMonthsRem = 0.0
    
    // Make sure we have good values
    humanYears = (humanYears < 0.0) ? 0.0 : humanYears
    humanMonths = (humanMonths < 0.0) ? 0.0 : humanMonths
    
    // Take care of months
    if humanMonths > MonthsInYear {
      humanYears = humanYears + Double(Int(humanMonths / MonthsInYear))
      humanMonthsRem = humanMonths % MonthsInYear
      if humanMonthsRem > 0.0 {
        humanYears = humanYears + (humanMonthsRem / MonthsInYear)
      }
    } else if humanMonths != 0.0 {
        humanYears = humanYears + (humanMonths / MonthsInYear)
    }
    
    // Calculate & format
    var dogAge:Double
    if (humanYears) > 2.0 {
      dogAge = (DogFactorBaby * DogTurnsAdult) + ((humanYears - 2) * DogFactorAdult)
    } else {
      dogAge = (humanYears * DogFactorBaby)
    }
    let DogAgeString = NSString(format: "%.2f", dogAge)
    
    // Update label with result
    dogAgeLabel.textColor = UIColor.blueColor()
    dogAgeLabel.text = "Your TRUE age in dog time is\n\(DogAgeString) years!"
    
    // Hide keypad
    yearsEntered.resignFirstResponder()
    monthsEntered.resignFirstResponder()
  }
}

