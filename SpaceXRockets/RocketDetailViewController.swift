//
//  RocketDetailViewController.swift
//  SpaceXRockets
//
//  Created by Aleksey Usanov on 18.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class RocketDetailViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    let rockets = try! Realm().objects(Rocket.self)
    var id = 0
    
    @IBOutlet weak var stagesChange: UISegmentedControl!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    //stage one
    @IBOutlet weak var engines: UILabel!
    @IBOutlet weak var reusable: UILabel!
    @IBOutlet weak var fuelAmount: UILabel!//tons
    @IBOutlet weak var burnTime: UILabel!//sec
    @IBOutlet weak var thrustSeaLevel: UILabel!
    @IBOutlet weak var thrustVacuum: UILabel!
    @IBOutlet weak var stageOneView: UIView!
    //stage two
    @IBOutlet weak var stageTwoView: UIView!
    @IBOutlet weak var enginesTwo: UILabel!
    @IBOutlet weak var reusableTwo: UILabel!
    @IBOutlet weak var fuelAmountTwo: UILabel!//tons
    @IBOutlet weak var burnTimeTwo: UILabel!//sec
    @IBOutlet weak var thrustTwo: UILabel!
    @IBOutlet weak var payloadsTwo: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stageTwoView.isHidden = true
        stagesChange.tintColor = .white
        let item = rockets.filter("id == \(id)")
        let index = Int.random(in: 0..<item[0].flickr_images.count - 1)
        let image = ImageResource(downloadURL: URL(string: item[0].flickr_images[index])!, cacheKey: item[0].flickr_images[index])
        self.background.kf.setImage(with: image)
        self.name.text = item[0].rocket_name
        self.company.text = "\(item[0].company)"
        self.country.text = item[0].country
        self.height.text = "\(item[0].height!.feet) feet"
        self.mass.text = "\(item[0].mass!.lb) lb"
        
        
        
        //stage one
        self.engines.text = "\(item[0].first_stage!.engines)"
        if item[0].first_stage!.reusable {
            self.reusable.text = "yes"
        } else {
            self.reusable.text = "no"
        }
        
        self.fuelAmount.text = "\(item[0].first_stage!.fuel_amount_tons) tons"
        self.burnTime.text = "\(item[0].first_stage!.burn_time_sec) sec"
        self.thrustSeaLevel.text = "\(item[0].first_stage!.thrust_sea_level!.lbf) lbf"
        self.thrustVacuum.text = "\(item[0].first_stage!.thrust_vacuum!.lbf) lbf"
        
        //stage two
        self.enginesTwo.text = "\(item[0].second_stage!.engines)"
        if item[0].second_stage!.reusable {
            self.reusableTwo.text = "yes"
        } else {
            self.reusableTwo.text = "no"
        }
        
        self.fuelAmountTwo.text = "\(item[0].second_stage!.fuel_amount_tons) tons"
        self.burnTimeTwo.text = "\(item[0].second_stage!.burn_time_sec) sec"
        self.thrustTwo.text = "\(item[0].second_stage!.thrust!.lbf) lbf"
        self.payloadsTwo.text = "\(item[0].second_stage!.payloads!.option_1)"
        
    }
    
    @IBAction func selectStage(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3) {
                self.stageOneView.isHidden = false
                self.stageTwoView.isHidden = true
            }
        } else {
             UIView.animate(withDuration: 0.3) {
            self.stageOneView.isHidden = true
            self.stageTwoView.isHidden = false
            }
        }
    }
    
}
