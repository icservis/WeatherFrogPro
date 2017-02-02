//
//  ForecastViewController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 15.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit
import ForecastIO

class ForecastViewController: UIViewController {
    
    var data : DataPoint? {
        didSet {
            print(data ?? "no value")
            
            if (data != nil) {
                self.navigationItem.title = String(describing: data!.time)
            } else {
                self.navigationItem.title = nil
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
