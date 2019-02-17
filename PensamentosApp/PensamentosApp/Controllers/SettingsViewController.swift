//
//  SettingsViewController.swift
//  PensamentosApp
//
//  Created by Henrique Augusto on 15/02/2019.
//  Copyright © 2019 Henrique Augusto. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var scColorSchem: UISegmentedControl!
    @IBOutlet weak var swTimeInterval: UISlider!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        
    }
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        
    }
    @IBAction func changeColorSchem(_ sender: UISegmentedControl) {
    }
    
}
