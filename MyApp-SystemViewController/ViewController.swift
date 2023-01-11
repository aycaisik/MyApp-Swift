//
//  ViewController.swift
//  MyApp-SystemViewController
//
//  Created by Ayça Işık on 11.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet var imageView: UIImageView!
    
    //MARK: - Properties
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
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
        
    }
    @IBAction func photosButtonTapped(_ button: UIButton){
        
    }
    @IBAction func emailButtonTapped(_ button: UIButton){
        
    }



}

