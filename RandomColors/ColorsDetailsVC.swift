//
//  ColorsDetailsVC.swift
//  RandomColours
//
//  Created by Zeeshan Waheed on 24/12/2023.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    
    // takes data from ColoursTableVC
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if color contains value set that as background color  else set blue as background color
        view.backgroundColor = color ?? .blue

        // Do any additional setup after loading the view.
    }
    
}
