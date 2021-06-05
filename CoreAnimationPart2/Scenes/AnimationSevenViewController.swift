//
//  AnimationFiveViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 04/06/21.
//

import UIKit

class AnimationSevenViewController: UIViewController {

  
  //MARK: Properties
  fileprivate lazy var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "maxwell-nelson-2"))
  
  fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
  
  fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
  
  //MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTabBar()
    configureView()
  }
  
  
  //MARK: Helpers
  func configureTabBar(){
    navigationController?.navigationBar.isHidden = false
  }
  func configureView(){
    view.backgroundColor = .white
   
    view.addSubview(imageView)
    imageView.frame = view.frame
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    
    view.addSubview(blurView)
    blurView.frame = view.frame
    blurView.alpha = 0.5
    blurView.layer.masksToBounds = true
    
    
    animator.addAnimations {
      self.blurView.alpha = 1
      self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
   
    perform(#selector(setupCABasic), with: nil, afterDelay: 1)
  }
  
  @objc fileprivate func setupCABasic(){

    let springAnimation = CASpringAnimation(keyPath: "transform.scale")
    springAnimation.fromValue = 0
    springAnimation.toValue = 1
    springAnimation.damping = 5
    springAnimation.mass = 0
    springAnimation.duration = 10
    
    imageView.layer.add(springAnimation,forKey: "renatomateusx.io/springanimation")
    blurView.layer.add(springAnimation,forKey: "renatomateusx.io/springanimation")
  }
  
  //MARK: Selectors
}
