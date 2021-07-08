//
//  LottieManager.swift
//  DogAPITestProject
//
//  Created by Hamza on 08/07/2021.
//

import Foundation
import UIKit
import Lottie

class LottieManager {
    
    //MARK:- SINGELTON CLASS
    static let shared: LottieManager = {
        let instance = LottieManager()
        return instance
    }()
    
    private init(){}

    
    
    private var animationView: AnimationView?
    private var overlay : UIView?
    
    //MARK:- DOG ANIMATION
    func runDogAnimation (animationParentView : UIView)
    {
        
        overlay = UIView(frame: animationParentView.frame)
        overlay?.backgroundColor = .white
        animationParentView.addSubview(overlay!)
        
        animationView = .init(name: "4888-dog-icon")
        animationView!.frame = animationParentView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationParentView.addSubview(animationView!)
        animationView!.play()
        
    }
    
    func stopAnimation()
    {
        animationView?.stop()
        animationView?.removeFromSuperview()
        overlay?.removeFromSuperview()
    }
    


}
