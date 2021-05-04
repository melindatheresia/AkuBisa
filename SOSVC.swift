//
//  SOSVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit

class SOSVC: UIViewController {

    @IBOutlet weak var polisiButton: UIButton!
    @IBOutlet weak var ambulansButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//      Shadow Color and Radius
        polisiButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.10).cgColor
        polisiButton.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        polisiButton.layer.shadowOpacity = 0.8
        polisiButton.layer.shadowRadius = 5.0
        polisiButton.layer.masksToBounds = false
        
//      Shadow Color and Radius
        ambulansButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.10).cgColor
        ambulansButton.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        ambulansButton.layer.shadowOpacity = 0.8
        ambulansButton.layer.shadowRadius = 5.0
        ambulansButton.layer.masksToBounds = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func telpPolisiBtn(_ sender: Any) {
        
        
////   https://www.zerotoappstore.com/how-to-make-a-phone-call-button-in-swift.html
//        guard let number = URL(string: "tel://" + "+6289619458979") else { return }
//        UIApplication.shared.open(number)

//   https://stackoverflow.com/questions/40078370/how-to-make-phone-call-in-ios-10-using-swift/48870081
        let nomorPolisi = "110"
            guard let url = URL(string: "tel://\(nomorPolisi)") else {
                return //be safe
            }

            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        
        // pengen nyobain ganti text di pop up "Call 110 -> "telpon polisi"
        
    }
    
    @IBAction func telpAmbulansBtn(_ sender: Any) {
        
        let nomorPolisi = "118"
            guard let url = URL(string: "tel://\(nomorPolisi)") else {
                return //be safe
            }

            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        
    }
    
    // pengen nyobain ganti text di pop up "Call 118 -> "telpon ambulans"
    
}
