//
//  SecondViewController.swift
//  WEATHER-V1.0
//
//  Created by Nazim Uddin on 1/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
protocol GetLocationDelegat {
    func saveData(city:String,countryKey:String)
}
class GetLocationViewController: UIViewController {

    @IBOutlet weak var cityName: UITextField!
    
    @IBOutlet weak var countryKey: UITextField!
    var delegat:GetLocationDelegat!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBtn(_ sender: Any) {
        if !cityName.text!.isEmpty && !countryKey.text!.isEmpty {
         delegat.saveData(city: cityName.text!, countryKey: countryKey.text!)
        }
    }
    

}
