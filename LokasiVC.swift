//
//  ViewController.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit

class LokasiVC: UIViewController {

    @IBOutlet weak var judulAkuBisa: UILabel!
    @IBOutlet weak var kirimLokasi: UIButton!
    @IBOutlet weak var lokasiTabBar: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
        
        
        
    }

    @IBAction func kirimLokasiBtn(_ sender: Any) {
        let phoneNumber =  "+6289619458979" // you need to change this number
        
        let longitude = 53.9187068 // coreLocation.getLongitude()
        let latitude = 27.5862874 // coreLocation.getLatitude()
        let locationUrl = "https://maps.google.com/?daddr=\(longitude),\(latitude)"
    
        
        
//        https://wa.me/08231231412?text=Halo%20name%20maya%20nadine
        let appURL = URL(string: "https://wa.me/\(phoneNumber)?text=\(locationUrl)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        } else {
            // WhatsApp is not installed
        }
    }
    
}

