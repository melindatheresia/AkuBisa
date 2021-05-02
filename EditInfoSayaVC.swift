//
//  EditInfoSayaVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 01/05/21.
//

import UIKit


class EditInfoSayaVC: UIViewController {
    
    var infoSayaVC: InfoSayaVC?

    @IBOutlet weak var saveInfo: UIButton!
    
    var namaAnak: String = ""
    @IBOutlet weak var namaAnakTextField: UITextField!
    var umurAnak: String = ""
    @IBOutlet weak var umurAnakTextField: UITextField!
    var alamatAnak: String = ""
    @IBOutlet weak var alamatAnakTextField: UITextField!
    
    var namaKereta: String = ""
    @IBOutlet weak var namaKeretaTextField: UITextField!
    var kodeBooking: String = ""
    @IBOutlet weak var kodeBookingTextField: UITextField!
    
    var dariStasiun: String = ""
    @IBOutlet weak var dariStasiunTextField: UITextField!
    var keStasiun: String = ""
    @IBOutlet weak var keStasiunTextField: UITextField!
    var jalurKereta: String = ""
    @IBOutlet weak var jalurKeretaTextField: UITextField!
    var tempatDuduk: String = ""
    @IBOutlet weak var tempatDudukTextField: UITextField!
    var jamBerangkat: String = ""
    @IBOutlet weak var jamBerangkatTextField: UITextField!
    var jamTiba: String = ""
    @IBOutlet weak var jamTibaTextField: UITextField!
    
    var catatanOrtu: String = ""
    @IBOutlet weak var catatanOrtuTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDefaultPlaceholder()
        copyVarKeTextFieldPlaceholder()
    }
    
    
    @IBAction func saveInfoBtn(_ sender: Any) {
        infoSayaVC?.onSaveInfoBtn(
            namaAnakBaru: namaAnakTextField.text!,
            umurAnakBaru: umurAnakTextField.text!,
            alamatAnakBaru: alamatAnakTextField.text!,
            namaKeretaBaru: namaKeretaTextField.text!,
            kodeBookingBaru: kodeBookingTextField.text!,
            dariStasiunBaru: dariStasiunTextField.text!,
            keStasiunBaru: keStasiunTextField.text!,
            jalurKeretaBaru: jalurKeretaTextField.text!,
            tempatDudukBaru: tempatDudukTextField.text!,
            jamBerangkatBaru: jamBerangkatTextField.text!,
            jamTibaBaru: jamTibaTextField.text!,
            catatanOrtuBaru: catatanOrtuTextField.text!)
    }
    
    func setDefaultPlaceholder() {
        namaAnakTextField.placeholder = "Nama Anak"
        umurAnakTextField.placeholder = "Umur Anak"
        alamatAnakTextField.placeholder = "Alamat Anak"
        
        namaKeretaTextField.placeholder = "Nama Kereta"
        kodeBookingTextField.placeholder = "Kode Booking"
        
        dariStasiunTextField.placeholder = "Stasiun Asal"
        keStasiunTextField.placeholder = "Stasiun Akhir"
        jalurKeretaTextField.placeholder = "Jalur Kereta"
        tempatDudukTextField.placeholder = "Gerbong, Tempat Duduk"
        jamBerangkatTextField.placeholder = "Jam Berangkat"
        jamTibaTextField.placeholder = "Jam Tiba"
        
        catatanOrtuTextField.placeholder = "Catatan dari Ortu"
    }
    
    func copyVarKeTextFieldPlaceholder() {
        namaAnakTextField.text = namaAnak
        umurAnakTextField.text = umurAnak
        alamatAnakTextField.text = alamatAnak
        
        namaKeretaTextField.text = namaKereta
        kodeBookingTextField.text = kodeBooking
        
        dariStasiunTextField.text = dariStasiun
        keStasiunTextField.text = keStasiun
        jalurKeretaTextField.text = jalurKereta
        tempatDudukTextField.text = tempatDuduk
        jamBerangkatTextField.text = jamBerangkat
        jamTibaTextField.text = jamTiba
        
        catatanOrtuTextField.text = catatanOrtu
    }
    
   

}
