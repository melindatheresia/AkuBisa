//
//  ViewController.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit
import CoreLocation

class LokasiVC: UIViewController {

    @IBOutlet weak var judulAkuBisa: UILabel!
    @IBOutlet weak var kirimLokasi: UIButton!
    @IBOutlet weak var lokasiTabBar: UITabBarItem!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        let judul = "Aku Bisa"
//        let boldAttribute = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 36)]
//        let judulBold = NSMutableAttributedString(string:judul, attributes:boldAttribute)
//        // TODO: Font ke SF-Pro-Display Black
//        judulAkuBisa.attributedText = judulBold
        
//      https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app
        judulAkuBisa.font = UIFont(name: "SF Pro Display Bold", size: 36.0)
    
        locationManager.requestWhenInUseAuthorization()
        
    }

    @IBAction func kirimLokasiBtn(_ sender: Any) {
        let phoneNumber =  "+6289619458979" // you need to change this number
        
    
//      https://www.tutorialspoint.com/how-to-get-the-current-location-latitude-and-longitude-in-ios ini buat ambil location longitude and latitude, permission to location
        var currentLoc: CLLocation!
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
        }
        
        let longitude = currentLoc.coordinate.longitude // coreLocation.getLongitude()
        let latitude = currentLoc.coordinate.latitude // coreLocation.getLatitude()
        let locationUrl = "https://maps.google.com/?daddr=\(longitude),\(latitude)"
    
        
//      https://docs.mtarget.co/en/guide/guide-linkwhatsapp/ ini buat link wa di bawah
//      https://wa.me/08231231412?text=Halo%20name%20maya%20nadine
        
//      https://stackoverflow.com/questions/39809620/how-to-open-whatsapp-from-swift-app ini buat open whatsapp
        let appURL = URL(string: "https://wa.me/\(phoneNumber)?text=Hi,%20now%20I'm%20here%20\(locationUrl)!")!
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
