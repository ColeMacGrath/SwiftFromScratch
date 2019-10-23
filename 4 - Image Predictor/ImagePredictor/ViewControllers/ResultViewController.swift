//
//  ViewController.swift
//  ImagePredictor
//
//  Created by Moisés Córdova on 16/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import Vision

class ResultViewController: UIViewController {
    
    var animalModel = AnimalsImageClassifier()
    @IBOutlet weak var choosenImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var predictionLabel: UILabel!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = " "
        predictionLabel.text = " "
        self.choosenImageView.image = image
        guard let ciImage = CIImage(image: image) else { return }
        analyze(image: ciImage)
    }
    
    func analyze(image: CIImage){
        guard let model = try? VNCoreMLModel(for: animalModel.model) else {
             fatalError("No se ha podido preparar el modelo de clasificación para Vision")
        }
        
        let alert = UIAlertController(title: nil, message: "Espere...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation], let prediction = results.first else {
                fatalError("Error al hacer la predicción: \(error?.localizedDescription ?? "Error Desconocido")")
            }
            
            DispatchQueue.main.async {
                let predictionString = prediction.identifier.prefix(1).capitalized + prediction.identifier.dropFirst()
                self.resultLabel.text = predictionString
                self.predictionLabel.text = "\(prediction.confidence * 100) %"
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        DispatchQueue.global(qos: .userInteractive).async {
            do{
                try handler.perform([request])
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func newImageButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
