//
//  InfoSayaVC.swift
//  AkuBisa
//
//  Created by Melinda Theresia on 28/04/21.
//

import UIKit

class InfoSayaVC: UIViewController{
    
    static let kontakDaruratNotification = Notification.Name("KontakDaruratBerubah")

    @IBOutlet weak var ubahInfo: UIButton!
    var gantiFoto: UIImage = #imageLiteral(resourceName: "NC 1 profile-6")
    @IBOutlet weak var profilePicture: UIImageView!
    
    var namaAnak: String = "Melinda Theresia"
    @IBOutlet weak var namaAnakLabel: UILabel!
    var umurAnak: String = "12"
    @IBOutlet weak var umurAnakLabel: UILabel!
    var alamatAnak: String = "Jl. ABC No 123, Jakarta"
    @IBOutlet weak var alamatAnakLabel: UILabel!

    var namaKereta: String = "Argo Bromo Anggrek"
    @IBOutlet weak var namaKeretaLabel: UILabel!
    var kodeBooking: String = "Eksekutif - 3D58HI"
    @IBOutlet weak var kodeBookingLabel: UILabel!
        
    var dariStasiun: String = "Semarang Tawang"
    @IBOutlet weak var dariStasiunLabel: UILabel!
    var keStasiun: String = "Gambir"
    @IBOutlet weak var keStasiunLabel: UILabel!
    var jalurKereta: String = "5"
    @IBOutlet weak var jalurKeretaLabel: UILabel!
    var tempatDuduk: String = "3, 15D"
    @IBOutlet weak var tempatDudukLabel: UILabel!
    var jamBerangkat: String = "12:28"
    @IBOutlet weak var jamBerangkatLabel: UILabel!
    var jamTiba: String = "17:44"
    @IBOutlet weak var jamTibaLabel: UILabel!
        
    var catatanOrtu: String = "Tolong jaga anak saya dengan baik ya. Hati-hati di jalan! Terima kasih!"
    @IBOutlet weak var catatanOrtuLabel: UILabel!
    
    @IBOutlet weak var kontakLabel: UILabel!
    var namaKontakDarurat: String = "Mom"
    var nomorKontakDarurat: String = "+6289619458979"
    @IBOutlet weak var namaKontakLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namaAnakLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        umurAnakLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        alamatAnakLabel.font = UIFont(name: "SF Pro Display Bold", size: 16.0)
        
        namaKeretaLabel.font = UIFont(name: "SF Pro Display Black", size: 22.0)
        kodeBookingLabel.font = UIFont(name: "SF Pro Display Regular", size: 18.0)
        
        dariStasiunLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        keStasiunLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        jalurKeretaLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        tempatDudukLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        jamBerangkatLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        jamTibaLabel.font = UIFont(name: "SF Pro Display Bold", size: 22.0)
        
        catatanOrtuLabel.font = UIFont(name: "SF Pro Display Regular", size: 16.0)
        
        kontakLabel.font = UIFont(name: "SF Pro Display Black", size: 22.0)
        
        // button shadow
        ubahInfo.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.10).cgColor
        ubahInfo.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        ubahInfo.layer.shadowOpacity = 1.0
        ubahInfo.layer.shadowRadius = 5.0
        ubahInfo.layer.masksToBounds = false
        
        profilePicture.layer.masksToBounds = true
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.layer.cornerRadius = 15
        
        copyVarKeLabel()
        fitAllLabels()
    }
    
    func fitAllLabels() {
        catatanOrtuLabel.textAlignment = .left
        catatanOrtuLabel.sizeToFit()
        
        alamatAnakLabel.sizeToFit()
        dariStasiunLabel.sizeToFit()
        keStasiunLabel.sizeToFit()
    }
    
    func copyVarKeLabel() {
        namaAnakLabel.text = namaAnak
        umurAnakLabel.text = umurAnak
        alamatAnakLabel.text = alamatAnak
        
        namaKeretaLabel.text = namaKereta
        kodeBookingLabel.text = kodeBooking
        
        dariStasiunLabel.text = dariStasiun
        keStasiunLabel.text = keStasiun
        jalurKeretaLabel.text = jalurKereta
        tempatDudukLabel.text = tempatDuduk
        jamBerangkatLabel.text = jamBerangkat
        jamTibaLabel.text = jamTiba
        
        catatanOrtuLabel.text = catatanOrtu
        namaKontakLabel.text = namaKontakDarurat

        profilePicture.image = gantiFoto
        
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
//    https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/#forward-segues kirim info ke EditInfoSayaVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EditInfoSayaVC {
            let editInfoSayaVC = segue.destination as? EditInfoSayaVC
            editInfoSayaVC?.infoSayaVC = self

            editInfoSayaVC?.namaAnak = namaAnak
            editInfoSayaVC?.umurAnak = umurAnak
            editInfoSayaVC?.alamatAnak = alamatAnak

            editInfoSayaVC?.namaKereta = namaKereta
            editInfoSayaVC?.kodeBooking = kodeBooking
            
            editInfoSayaVC?.dariStasiun = dariStasiun
            editInfoSayaVC?.keStasiun = keStasiun
            editInfoSayaVC?.jalurKereta = jalurKereta
            editInfoSayaVC?.tempatDuduk = tempatDuduk
            editInfoSayaVC?.jamBerangkat = jamBerangkat
            editInfoSayaVC?.jamTiba = jamTiba
            
            editInfoSayaVC?.catatanOrtu = catatanOrtu
            
            editInfoSayaVC?.namaKontakDarurat = namaKontakDarurat
            editInfoSayaVC?.nomorKontakDarurat = nomorKontakDarurat
            editInfoSayaVC?.fotoDariInfoSaya = gantiFoto
        }
    }
    
    func onSaveInfoBtn(namaAnakBaru: String, umurAnakBaru: String, alamatAnakBaru: String, namaKeretaBaru: String, kodeBookingBaru: String, dariStasiunBaru: String, keStasiunBaru: String, jalurKeretaBaru: String, tempatDudukBaru: String, jamBerangkatBaru: String, jamTibaBaru: String, catatanOrtuBaru: String, namaKontakDaruratBaru: String, nomorKontakDaruratBaru: String, gantiFotoBaru: UIImage) {
        namaAnak = namaAnakBaru
        umurAnak = umurAnakBaru
        alamatAnak = alamatAnakBaru
        
        namaKereta = namaKeretaBaru
        kodeBooking = kodeBookingBaru
        
        dariStasiun = dariStasiunBaru
        keStasiun = keStasiunBaru
        jalurKereta = jalurKeretaBaru
        tempatDuduk = tempatDudukBaru
        jamBerangkat = jamBerangkatBaru
        jamTiba = jamTibaBaru
        
        catatanOrtu = catatanOrtuBaru
        namaKontakDarurat = namaKontakDaruratBaru
        nomorKontakDarurat = nomorKontakDaruratBaru
        
        gantiFoto = gantiFotoBaru
        
        let dictionary = ["nomorKontakDaruratBaru":nomorKontakDaruratBaru]
        NotificationCenter.default.post(name: InfoSayaVC.kontakDaruratNotification, object: nil, userInfo: dictionary)
        
        copyVarKeLabel()
    }

    
    
    // Kontak Darurat
    @IBAction func messageKontakBtn(_ sender: Any) {
        let messageDarurat = URL( string: "https://wa.me/\(nomorKontakDarurat)")!
        if UIApplication.shared.canOpenURL(messageDarurat) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(messageDarurat, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(messageDarurat)
            }
        } else {
            // WhatsApp is not installed
        }
    }
    
    @IBAction func callKontakBtn(_ sender: Any) {
        let callDarurat = nomorKontakDarurat
            guard let url = URL(string: "tel://\(callDarurat)") else {
                return //be safe
            }

            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
    }
    
    
    
}
