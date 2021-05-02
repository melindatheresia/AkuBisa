//
//  InfoSayaVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit

class InfoSayaVC: UIViewController {

    @IBOutlet weak var ubahInfo: UIButton!
    
    @IBOutlet weak var namaAnakLabel: UILabel!
    @IBOutlet weak var umurAnakLabel: UILabel!
    @IBOutlet weak var alamatAnakLabel: UILabel!
        
    @IBOutlet weak var namaKeretaLabel: UILabel!
    @IBOutlet weak var kodeBookingLabel: UILabel!
        
    @IBOutlet weak var dariStasiunLabel: UILabel!
    @IBOutlet weak var keStasiunLabel: UILabel!
    @IBOutlet weak var jalurKeretaLabel: UILabel!
    @IBOutlet weak var tempatDudukLabel: UILabel!
    @IBOutlet weak var jamBerangkatLabel: UILabel!
    @IBOutlet weak var jamTibaLabel: UILabel!
        
    @IBOutlet weak var catatanOrtuLabel: UILabel!
        
    @IBOutlet weak var kontakLabel: UILabel!
    @IBOutlet weak var listKontak: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        isiNama.delegate = self
        //        isiNama.isHidden = true
        //        namaAnak.isUserInteractionEnabled = true
        //        let aSelector : Selector = Selector(("lblTapped"))
        //        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        //        tapGesture.numberOfTapsRequired = 1
        //        namaAnak.addGestureRecognizer(tapGesture)
                
                saveDetails()
    }

    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
        
        func saveDetails() {
//            setAllTextFieldHidden(isHidden: true)
//            copyTextFieldKeLabel()
            setAllLabelHidden(isHidden: false)
        }
        
        func goToEditDetails() {
            setAllLabelHidden(isHidden: true)
//            copyLabelKeTextField()
//            setAllTextFieldHidden(isHidden: false)
        }
        
//        func copyLabelKeTextField() {
//            namaKeretaTextField.text = namaKeretaLabel.text
//        }
//
//        func copyTextFieldKeLabel() {
//            namaKeretaLabel.text = namaKeretaTextField.text
//        }

        func setAllLabelHidden(isHidden: Bool) {
            namaKeretaLabel.isHidden = isHidden
        }
        
//        func setAllTextFieldHidden(isHidden: Bool) {
//            namaKeretaTextField.isHidden = isHidden
//        }
        
    //    func lblTapped(){
    //        lbl.hidden = true
    //        textF.hidden = false
    //        textF.text = lbl.text
    //    }
    //
    //    func textFieldShouldReturn(userText: UITextField) -> Bool {
    //        userText.resignFirstResponder()
    //        textF.hidden = true
    //        lbl.hidden = false
    //        lbl.text = textF.text
    //        return true
    //    }
    //

}
