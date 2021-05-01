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
//
        
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
