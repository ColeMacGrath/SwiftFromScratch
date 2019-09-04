//
//  ViewController.swift
//  Interfaz-1
//
//  Created by Moisés Córdova on 9/3/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() { //viewDidLoad, método que se ejecuta antes de que se cargue la vista
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage() //Remueve la línea de la barra de título
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 //Retorna la cantidad de elementos a mostrar
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coverCell", for: indexPath) as! CoverCollectionViewCell //Desencolamos la celda con el identificador y la convertimos a nuestra celda personalizada (CoverCollectionViewCell)
        cell.coverUIImageView.image = #imageLiteral(resourceName: "cover") //Asigación de la imagen
        //cell.coverUIImageView.image = UIImage(named: "cover") se puede insertar la imágen con el nombre
        cell.artistLabel.text = "Lindsey Stirling" //Asignando el contenido de la primera etiqueta
        cell.songLabel.text = "Roundtable Rival" //Asignando el contenido de la segunda etiqueta
        
        return cell //Retornando la celda configurada
    }
}
