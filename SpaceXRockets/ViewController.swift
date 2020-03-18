//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Aleksey Usanov on 17.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private let realm = try! Realm()
    let rockets = try! Realm().objects(Rocket.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SpaceX Rokets"
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        getRockets()
    }
    
    func getRockets() {
        AF.request("https://api.spacexdata.com/v3/rockets").responseArray { (response:AFDataResponse<[Rocket]>) in
            if let items = response.value {
                try! self.realm.write {
                    self.realm.deleteAll()
                }
                do {
                    try self.realm.write {
                        for item in items {
                            self.realm.add(item)
                        }
                    }
                    self.collectionView.reloadData()
                } catch _ {
                    print("error")
                }
            }
        }
    }
    
    
    
    @objc func seeMore(sender: UIButton!) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "rocketDetails") as! RocketDetailViewController
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .coverVertical
        vc.id = self.rockets[sender.tag].id
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rocket", for: indexPath) as! RocketCollectionViewCell
        
        if !rockets[indexPath.row].flickr_images.isEmpty {
            let index = Int.random(in: 0..<rockets[indexPath.row].flickr_images.count - 1)
            let image = ImageResource(downloadURL: URL(string: rockets[indexPath.row].flickr_images[index])!, cacheKey: rockets[indexPath.row].flickr_images[index])
            cell.background.kf.setImage(with: image)
            cell.nameLabel.text = rockets[indexPath.row].rocket_name
            cell.typeLabel.text = rockets[indexPath.row].description_field
            cell.more.addTarget(self, action: #selector(seeMore(sender:)), for: .touchUpInside)
            cell.more.tag = indexPath.row
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.setNavigationBarHidden(!(self.navigationController?.navigationBar.isHidden)!, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height - 12)
    }
}

