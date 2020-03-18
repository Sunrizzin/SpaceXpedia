//
//  RocketCollectionViewCell.swift
//  SpaceXRockets
//
//  Created by Aleksey Usanov on 18.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var more: UIButton!
    
    override func draw(_ rect: CGRect) {
        shadowView.backgroundColor = .red
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.8
        
        more.layer.cornerRadius = 10
        more.layer.borderColor = UIColor.white.cgColor
        more.layer.borderWidth = 1
    }
    
}
