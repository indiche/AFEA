//
//  DetailsViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 16/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var circleContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var leftBottomPercentageLabel: EFCountingLabel!
    @IBOutlet weak var middleBottomPercetnageLabel: EFCountingLabel!
    @IBOutlet weak var rightBottomPercentageLabel: EFCountingLabel!
    
    @IBOutlet weak var leftBottomExplanationLabel: UILabel!
    @IBOutlet weak var middleBottomExplanationLabel: UILabel!
    @IBOutlet weak var rightBottomExplanationLabel: UILabel!
    
    var smallCircleView: CircleView!
    var mediumCircleView: CircleView!
    var bigCircleView: CircleView!
    
    var foodModel: FoodModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        subtitleLabel.text = foodModel.subtitle
        
        let bigCircleView = CircleView(frame: circleContainerView.bounds, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.pastelRed)
        circleContainerView.addSubview(bigCircleView)
        self.bigCircleView = bigCircleView
        
        var mediumFrame = circleContainerView.bounds
        mediumFrame.size.width = mediumFrame.size.width - 42
        mediumFrame.size.height = mediumFrame.size.height - 42
        mediumFrame.origin.x = mediumFrame.origin.x + 21
        mediumFrame.origin.y = mediumFrame.origin.y + 21
        
        let mediumCircleView = CircleView(frame: mediumFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.purpleGrey)
        circleContainerView.addSubview(mediumCircleView)
        self.mediumCircleView = mediumCircleView
        
        var smallFrame = mediumFrame
        smallFrame.size.width = smallFrame.size.width - 42
        smallFrame.size.height = smallFrame.size.height - 42
        smallFrame.origin.x = smallFrame.origin.x + 21
        smallFrame.origin.y = smallFrame.origin.y + 21
        
        let smallCircleView = CircleView(frame: smallFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.darkSkyBlue)
        circleContainerView.addSubview(smallCircleView)
        self.smallCircleView = smallCircleView
    }
    
    func updateView() {
        
        bigCircleView.animateCircle(duration: 0.6, percentage: self.foodModel.carbohydrates)
        mediumCircleView.animateCircle(duration: 0.6, percentage: self.foodModel.protein)
        smallCircleView.animateCircle(duration: 0.6, percentage: self.foodModel.fatt)
        
        bigCircleView.alpha = 0
        mediumCircleView.alpha = 0
        smallCircleView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.bigCircleView.alpha = 1
            self.mediumCircleView.alpha = 1
            self.smallCircleView.alpha = 1
        }
        
        let formatBlock =  {
            (value: CGFloat) in
            return String(Int(value)) + "%"
        }
        leftBottomPercentageLabel.formatBlock = formatBlock
        middleBottomPercetnageLabel.formatBlock = formatBlock
        rightBottomPercentageLabel.formatBlock = formatBlock
        
        leftBottomPercentageLabel.countFrom(0, to: self.foodModel.carbohydrates * 100, withDuration: 0.6)
        middleBottomPercetnageLabel.countFrom(0, to: self.foodModel.protein * 100, withDuration: 0.6)
        rightBottomPercentageLabel.countFrom(0, to: self.foodModel.fatt * 100, withDuration: 0.6)
    }

}
