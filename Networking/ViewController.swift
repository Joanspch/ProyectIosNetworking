//
//  ViewController.swift
//  Networking
//
//  Created by Joan Paredes on 10/12/20.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var downloadImageButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        //lineas infinitas
        nameLabel.numberOfLines = 0
        emailLabel.text = ""
        emailLabel.numberOfLines = 0
        idLabel.text = ""
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
    }


    @IBAction func getUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 1526){ (user) in
            self.activityIndicator.stopAnimating()
            
            self.setup(user: user)
        } failure: {(error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "Joan3", email: "joanchaupis@hotmail", gender: "Female", status: "Active")
        NetworkingProvider.shared.addUser(user: newUser ){ (user) in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
        } failure: {(error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
    }
    
    @IBAction func putUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "Joan", email: nil, gender: nil, status: nil)
        NetworkingProvider.shared.updateUser(id:1526, user: newUser ){ (user) in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
      
        } failure: {(error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
    }
    
   
    @IBAction func deleteUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let id = 1526
        NetworkingProvider.shared.delateUser(id:id){
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = "Se ha borrado el usuario con ID: \(id)"
            self.emailLabel.text = ""
            self.idLabel.text = ""
     
      
        } failure: {(error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
        
    }
    @IBAction func downloadImageAction(_ sender: Any) {
        downloadImageButton.isHidden = true
        myImage.kf.setImage(with: URL(string:"https://www.apple.com/v/swift/c/images/overview/icon_swift_hero_large.png"))
    }
    private func setup(user: User){
        self.nameLabel.text = user.name
        self.emailLabel.text = user.email
        self.idLabel.text = user.id?.description
    }
}


