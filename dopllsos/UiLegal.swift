//
//  UiLegal.swift
//  dopllsos
//
//  Created by Grupo Barca on 20/11/22.
//

import UIKit

class UiLegal: UIViewController {
    
    @IBOutlet var btnTerminos: UIButton!
    @IBOutlet var btnPrivacidad: UIButton!
    let urlTerminos = String(Rutas.terminos)
    let urlPrivacidad = String(Rutas.privacidad)

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
    }
    
    
    @IBAction func btnTerminos(_ sender: Any) {
        if let url = URL(string: urlTerminos), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func btnPrivacidad(_ sender: Any) {
        if let url = URL(string: urlPrivacidad), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    

}
