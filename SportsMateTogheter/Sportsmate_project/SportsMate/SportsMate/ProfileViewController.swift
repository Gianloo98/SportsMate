//
//  ProfileViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 16/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        // Do any additional setup after loading the view.
    }
    
    func setImage(){
        profileImage.image = UIImage(named: "imageTest")
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
