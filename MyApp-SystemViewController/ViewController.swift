//
//  ViewController.swift
//  MyApp-SystemViewController
//
//  Created by Ayça Işık on 11.01.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //MARK: - UI Elements
    
    @IBOutlet var imageView: UIImageView!
    
    //MARK: - Properties
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Bu fonksiyon , UImagePicker tarafından bir fotoğraf seçildiğinde veya çekildiğinde çalışır.
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        //Seçilen görseli ImageViewa aktarmak.
        imageView.image = selectedImage
        //Bir ViewControllerın ekrandan gitmesi için kullanılan fonksiyon dismiss.
        dismiss(animated: true,completion: nil)
    }
    
    //MARK: -Actions
    
    @IBAction func shareButtonTapped(_ button: UIButton){
        //Ekranda bulunan imageviewda bir görsel olduğundan emin oluyorsunuz.
        guard let image = imageView.image else {return}
        //Adım 1: ActivityController nesnesi oluşturmak.
        //activityitems: paylaşılacak olan nesneler (String, image, int, url..)
        //applicationactivities: hangi platformda paylaşılmasına izin verileceği(tw,messages,email)
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        //bulunduğumuz controllerda yeni bir controller göstermek için kullanılır.
        present(activityController, animated: true,completion: nil)
        
    }
    @IBAction func safariButtonTapped(_ button: UIButton){
        if let url = URL(string: "https://www.wwf.eu/"){
            let safariController = SFSafariViewController(url: url)
            present(safariController,animated: true,completion: nil)
        }
        
    }
    @IBAction func photosButtonTapped(_ button: UIButton){
        let imagePickerController = UIImagePickerController()
        //ImagePickerControllerın yöneticisi olan sınıfın bu viewController olduğunu belirtir.
        //Belirtmezseniz delegete fonk çalışmaz.
        imagePickerController.delegate = self
        
        
        
        
        
        
        
        //.actionsheet : ekranın altından gelen sayfa görünümünde
        //.alert : ekranın ortasından beliren pop-up
        
        //Adım 1: AlertController oluşturmak.
        let alertController = UIAlertController(title: "Görsel kaynağını seçin", message: nil, preferredStyle: .actionSheet)
        
        //Adım 2: Aksiyonları oluşturmak.
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let cameraAction = UIAlertAction(title: "Kamera", style: .default) { (action) in
            //Aksiyon tetiklendiğinde bu kod bloğu çalışır.
            
            imagePickerController.sourceType = .camera //Controllerın nasıl açılacağını belirtir.
            self.present(imagePickerController,animated: true,completion: nil)

            //print("Kamera")
            
        }
        
        let photoLibrary = UIAlertAction(title: "Fotoğraf Galerisi", style: .default) { (action) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true,completion: nil)


           // print("Fotoğraf Galerisi")
        }
        
        //Adım 3: Oluşturulan aksiyonları UIAlertControllera eklenir.
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibrary)
        
        
        //Adım 4: Ekranda gösteriniz.
        present(alertController,animated: true,completion: nil)
        
        
    }
    @IBAction func emailButtonTapped(_ button: UIButton){
        
    }



}

