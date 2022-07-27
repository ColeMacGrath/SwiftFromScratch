//
//  ViewController.swift
//  Phrases
//
//  Created by Moisés on 7/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    let alert = UIAlertController(title: nil, message: "Cargando Frase...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.style = .medium
        self.loadingIndicator.startAnimating()
        self.alert.view.addSubview(self.loadingIndicator)
        
        self.loadNewPhrase()
    }

    @IBAction func newPhraseButtonPressed(_ sender: UIButton) {
        self.loadNewPhrase()
    }
    
    private func loadNewPhrase() {
        self.present(self.alert, animated: true)
        
        APIService.shared.request(url: "http://www.boredapi.com/api/activity") { phrase, error in
            DispatchQueue.main.async {
                self.alert.dismiss(animated: true)
                
                if error != nil {
                    self.phraseLabel.text = nil
                    self.activityLabel.text = "Error al cargar la frase"
                }
                
                if let phrase = phrase {
                    self.phraseLabel.text = phrase.activity
                    self.activityLabel.text = phrase.type
                }
            }
        }
    }
}
