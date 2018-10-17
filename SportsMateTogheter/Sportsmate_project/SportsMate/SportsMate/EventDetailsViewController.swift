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
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBOutlet weak var creatorImage: UIImageView!
    
    enum state {
        case unjoined
        case joined
        case created
    }
    var currentState = state.unjoined
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatorImage.image = UIImage(named: "imageTest")
        creatorImage.layer.cornerRadius = creatorImage.frame.size.width/2
        creatorImage.clipsToBounds = true
        checkState()
        
        // Do any additional setup after loading the view.
    }
    
    func checkState (){
        if currentState == state.joined {
            joinButton.isHidden = true
            unjoinButton.isHidden = false
            self.navigationItem.rightBarButtonItem = nil
            currentState = .unjoined
        } else if currentState == state.unjoined {
            joinButton.isHidden = false
            unjoinButton.isHidden = true
            self.navigationItem.rightBarButtonItem = nil
            currentState = .joined
        } else if currentState == state.created {
            joinButton.isHidden = true
            unjoinButton.isHidden = true
            self.navigationItem.rightBarButtonItem = self.editButton
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
