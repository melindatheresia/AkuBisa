//
//  ViewController.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit
import CoreLocation

class LokasiVC: UIViewController, CLLocationManagerDelegate {

     var locationManager = CLLocationManager()
     var latitude: CLLocationDegrees?
     var longitude: CLLocationDegrees?
     var phoneNumber = "+6289619458979"
     
    @IBOutlet weak var judulAkuBisa: UILabel!
    @IBOutlet weak var kirimLokasi: UIButton!
    @IBOutlet weak var lokasiTabBar: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//      subscribe ke kontak darurat, kalau ganti, tombol lokasi kirim ke nomor yang baru ini
     NotificationCenter.default.addObserver(self, selector: #selector(kalauKontakDaruratBerubah(notification:)), name: InfoSayaVC.kontakDaruratNotification, object: nil)
     
        
//      https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app
        judulAkuBisa.font = UIFont(name: "SF Pro Display Bold", size: 36.0)
      
//      https://stackoverflow.com/questions/27076419/uibutton-bottom-shadow
//      Shadow Color and Radius
        kirimLokasi.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.10).cgColor
        kirimLokasi.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        kirimLokasi.layer.shadowOpacity = 1.0
        kirimLokasi.layer.shadowRadius = 5.0
        kirimLokasi.layer.masksToBounds = false
     
     self.locationManager.requestAlwaysAuthorization()
     self.locationManager.requestWhenInUseAuthorization()
     if (CLLocationManager.locationServicesEnabled()) {
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.startUpdatingLocation()
     }
    }
     
     override func viewDidAppear(_ animated: Bool) {
          locationManager.startUpdatingLocation()
     }
     
     @objc func kalauKontakDaruratBerubah(notification: Notification) {
          if (notification.userInfo!["nomorKontakDaruratBaru"] != nil) {
               phoneNumber = "\(notification.userInfo!["nomorKontakDaruratBaru"]!)" // notifikasi yang diterima adalah nomor kontak darurat yang baru bila ada edit
          }
     }

     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          guard let location: CLLocationCoordinate2D = manager.location?.coordinate else {return}
//          locationManager = location
          latitude = location.latitude
          longitude = location.longitude
     }
    
    @IBAction func kirimLokasiBtn(_ sender: Any) {
//      https://www.tutorialspoint.com/how-to-get-the-current-location-latitude-and-longitude-in-ios ini buat ambil location longitude and latitude, permission to location
     let authorizationStatus = locationManager.authorizationStatus
        
     if (authorizationStatus != .restricted && authorizationStatus != .denied) {
          //          guard let currentLocation = locationManager.location else { return }
          
          if let lat = latitude, let long = longitude {
               
               let longitude = long
               let latitude = lat
               let locationUrl = "https://maps.google.com/?q=@\(latitude),\(longitude)"
//               https://maps.google.com/?q=@-6.3012645,106.65437
//               "https://maps.google.com/?daddr=\(longitude),\(latitude)"
               
               //      https://docs.mtarget.co/en/guide/guide-linkwhatsapp/ ini buat link wa di bawah
               //      https://wa.me/08231231412?text=Halo%20name%20maya%20nadine
               
               //      https://stackoverflow.com/questions/39809620/how-to-open-whatsapp-from-swift-app ini buat open whatsapp
               let appURL = URL(string: "https://wa.me/\(phoneNumber)?text=Hi,%20now%20I'm%20here%20!%20\(locationUrl)")!
               if UIApplication.shared.canOpenURL(appURL) {
                    if #available(iOS 10.0, *) {
                         UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                    } else {
                         UIApplication.shared.openURL(appURL)
                    }
               } else {
                    // WhatsApp is not installed
               }
          } else {
               // Location is not enabled/authorized
          }
     }
     
     locationManager.stopUpdatingLocation()
     
    }
}
