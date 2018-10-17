//
//  EventDetailsViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 17/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit
import MapKit

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var unjoinButton: UIButton!
    
    @IBOutlet var creatorImage: UIImage?
    var joined :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkState()
        creatorImage = UIImage(named: "imageTest")
        // Do any additional setup after loading the view.
    }
    
    func checkState (){
        if joined {
            joinButton.isHidden = true
            unjoinButton.isHidden = false
            joined=false
        } else {
            joinButton.isHidden = false
            unjoinButton.isHidden = true
            joined=true
        }
    }
    
    @IBAction func joinPressed(_ sender: Any) {
        checkState()
    }
    
    @IBAction func unjoinPressed(_ sender: Any) {
        checkState()
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
