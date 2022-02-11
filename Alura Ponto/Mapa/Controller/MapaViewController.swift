//
//  MapaViewController.swift
//  Alura Ponto
//
//  Created by Natanael Alves Pereira on 10/02/22.
//

import UIKit

class MapaViewController: UIViewController {
    // MARK: - Atributos
    
    private var recibo : Recibo?
    
    // MARK: - Instaciar
    
    class func  instanciar(_ recibo: Recibo?)-> MapaViewController {
        let controller = MapaViewController (nibName: "MapaViewController", bundle: nil)
        
        return controller
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Métodos
    
    func setRegiao() {
        
        
    }

}
