//
//  ViewController.swift
//  dopllsos
//
//  Created by Grupo Barca on 20/11/22.
//

import UIKit
import AppCenter
import AppCenterCrashes

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        AppCenter.start(withAppSecret: "7c39c7b8-d9f5-4bf7-a22c-cdc3760ac326", services:[
          Crashes.self
        ])
        
         DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
        
         let uiLogin = self.storyboard?.instantiateViewController(withIdentifier: "UiLogin") as! UiLogin
         self.present(uiLogin, animated: true)
        
        })
        
    }
    
    
   

}

