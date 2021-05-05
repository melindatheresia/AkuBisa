//
//  EditInfoSayaVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 01/05/21.
//

import UIKit


class EditInfoSayaVC: UIViewController {
    
    var infoSayaVC: InfoSayaVC?

    var gantiFoto = UIImagePickerController()
    var fotoDariInfoSaya: UIImage = UIImage()
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
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
            
            gantiFoto.delegate = self
            
            profilePicture.layer.masksToBounds = true
            profilePicture.contentMode = .scaleAspectFill
            profilePicture.layer.cornerRadius = 15
            
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
                nomorKontakDaruratBaru: nomorKontakTextField.text!,
                gantiFotoBaru: profilePicture.image!)
        }
        
        
        @IBOutlet weak var scrollView: UIScrollView!
        func setDefaultPlaceholder() {
            
            namaAnakTextField.placeholder = "Nama Anak"
            umurAnakTextField.placeholder = "Umur Anak"
            alamatAnakTextField.placeholder = "Alamat Anak"
            
            namaKeretaTextField.placeholder = "Nama Kereta"
            kodeBookingTextField.placeholder = "Kelas - Kode Booking"
            
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
            
            profilePicture.image = fotoDariInfoSaya
            
        }
        
        @objc func keyboardWillShow (notification:NSNotification) {

            guard let userInfo = notification.userInfo else { return }
            var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)

            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 20
            scrollView.contentInset = contentInset
        }

        @objc func keyboardWillHide (notification:NSNotification) {

            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }
        
        @IBAction func gantiProfilePictureBtn(_ sender: AnyObject) {
            
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //https://www.youtube.com/watch?v=0EF2QsUOj90
            gantiFoto.sourceType = .photoLibrary
            gantiFoto.allowsEditing = true
            present(gantiFoto, animated: true, completion: nil)
            
            profilePicture.layer.masksToBounds = true
            profilePicture.contentMode = .scaleAspectFill
            profilePicture.layer.cornerRadius = 15
        }
    }
}

extension EditInfoSayaVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profilePicture.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

//extension UIImageView {
//    var contentClippingRect: CGRect {
//        guard let image = image else { return bounds }
//        guard contentMode == .scaleAspectFill else { return bounds }
//        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
//
//        let scale: CGFloat
//        if image.size.width > image.size.height {
//            scale = bounds.width / image.size.width
//        } else {
//            scale = bounds.height / image.size.height
//        }
//
//        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
//        let x = (bounds.width - size.width) / 2.0
//        let y = (bounds.height - size.height) / 2.0
//
//        return CGRect(x: x, y: y, width: size.width, height: size.height)
//    }
//}
