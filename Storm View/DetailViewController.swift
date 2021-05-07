//
//  DetalilViewController.swift
//  Storm View
//
//  Created by Usertqi on 06/05/21.
//

import UIKit

class DetalilViewController: UIViewController {
    
    //MARK: - IBOUTLETS -
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - VARIABLES -
    var selectedImage: String?
    
    // MARK: - LIFE CICLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}

// MARK: - AUX FUNCS -
extension DetalilViewController {
    func addImage() {
        if let goToImage = selectedImage {
            imageView.image = UIImage(named: goToImage)
        }
    }
}
