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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = rockets.filter("id == \(id)")
        let index = Int.random(in: 0..<item[0].flickr_images.count - 1)
        let image = ImageResource(downloadURL: URL(string: item[0].flickr_images[index])!, cacheKey: item[0].flickr_images[index])
        self.background.kf.setImage(with: image)
        self.name.text = item[0].rocket_name
        self.company.text = "\(item[0].stages) stages"
        self.country.text = item[0].country
        
        self.height.text = "\(item[0].height!.feet) feet"
        
        
        self.mass.text = "\(item[0].mass!.lb) lb"
        
        
    }
    
    @IBAction func selectStage(_ sender: UISegmentedControl) {
        
    }
    
}
