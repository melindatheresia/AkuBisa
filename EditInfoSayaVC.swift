//
//  EditInfoSayaVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 01/05/21.
//

import UIKit


class EditInfoSayaVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var infoSayaVC: InfoSayaVC?

    var gantiFoto = UIImagePickerController()
    @IBOutlet weak var profilePicture: UIImageView!
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
    
    var namaKontakDarurat: String = ""
    @IBOutlet weak var namaKontakTextField: UITextField!
    var nomorKontakDarurat: String = ""
    @IBOutlet weak var nomorKontakTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // button shadow
        saveInfo.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.10).cgColor
        saveInfo.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        saveInfo.layer.shadowOpacity = 1.0
        saveInfo.layer.shadowRadius = 5.0
        saveInfo.layer.masksToBounds = false
        
        
        setDefaultPlaceholder()
        copyVarKeTextFieldPlaceholder()
    }
    
//    https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/#back-properties kirim info dari textfield ke InfoSayaVC
    @IBAction func saveInfoBtn(_ sender: Any) {
        infoSayaVC?.onSaveInfoBtn (
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
            catatanOrtuBaru: catatanOrtuTextField.text!,
            namaKontakDaruratBaru: namaKontakTextField.text!,
            nomorKontakDaruratBaru: nomorKontakTextField.text!)
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
        
        namaKontakTextField.placeholder = "Nama Kontak Darurat"
        nomorKontakTextField.placeholder = "Nomor Kontak Darurat"
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
        
        namaKontakTextField.text = namaKontakDarurat
        nomorKontakTextField.text = nomorKontakDarurat
    }
    
    @IBAction func gantiProfilePictureBtn(_ sender: AnyObject) {
        
        }
    

}

extension LokasiVC: UIImagePickerControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Ganti Foto", message: "Ganti foto anak", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Ambil Foto", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Pilih dari album", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController
        vc.SourceType = .camera
        vc.delete(self)
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func presentPhotoPicker() {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
}
