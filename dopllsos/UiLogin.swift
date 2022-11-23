//
//  UiLogin.swift
//  dopllsos
//
//  Created by Grupo Barca on 20/11/22.
//

import UIKit

class UiLogin: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var txtMail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    var iconClick = false
    let imageicon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        assignbackground()
        
        txtMail.delegate = self
        txtMail.tag = 0
        txtPassword.delegate = self
        txtPassword.tag = 1
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        imageicon.image = UIImage(named: "invisible")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "invisible")!.size.width, height: UIImage(named: "invisible")!.size.height)
        
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "invisible")!.size.width, height: UIImage(named: "invisible")!.size.height)
        
        txtPassword.rightView = contentView
        txtPassword.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
        
        view.addGestureRecognizer(tap)

        
    }
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if iconClick{
            iconClick = false
            tappedImage.image = UIImage(named: "visibilidad")
            txtPassword.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(named: "invisible")
            txtPassword.isSecureTextEntry = true
        }
    }
    
    func assignbackground(){
        let background = UIImage(named: "bg-login.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
             nextField.becomeFirstResponder()
          } else {
             textField.resignFirstResponder()
          }
          return false
       }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
