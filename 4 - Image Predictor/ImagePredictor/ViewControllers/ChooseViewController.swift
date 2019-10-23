//
//  ChooseViewController.swift
//  ImagePredictor
//
//  Created by Moisés Córdova on 16/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imagePicker: ImagePicker!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }

}

extension ChooseViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseCell", for: indexPath) as! ChooseCollectionViewCell
        if indexPath.row == 0 {
            cell.titleLabel.text = "Elegir una imagen del carrete"
            cell.descriptionLabel.text = "Escoger una imágen del rollo fotográfico"
            cell.picture.image = #imageLiteral(resourceName: "photo-icon")
            cell.buttonLabel.text = "Escoger"
            cell.cardView.backgroundColor = #colorLiteral(red: 0.8487338424, green: 0.4599757791, blue: 0.8346146941, alpha: 1)
        } else {
            cell.titleLabel.text = "Tomar una imagen desde la camára"
            cell.descriptionLabel.text = "Abrir la camára fotográfica y tomar una imágen"
            cell.picture.image = #imageLiteral(resourceName: "camera-icon")
            cell.buttonLabel.text = "Tomar Fotografía"
            cell.cardView.backgroundColor = #colorLiteral(red: 0.2857307792, green: 0.6915889978, blue: 0.9931103587, alpha: 1)
        }
        
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320.0, height: 600.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imagePicker.present(from: self.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseImageVC" {
            guard let viewController = segue.destination as? ResultViewController else { return }
            viewController.image = self.selectedImage
        }
    }
}

extension ChooseViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if image != nil {
            self.selectedImage = image
            performSegue(withIdentifier: "chooseImageVC", sender: nil)
        }
    }
}
