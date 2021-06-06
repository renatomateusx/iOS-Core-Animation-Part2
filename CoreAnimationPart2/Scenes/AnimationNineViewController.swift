//
//  AnimationNineViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 06/06/21.
//

import UIKit

class AnimationNineViewController: UIViewController {

  
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
   
    self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    perform(#selector(shakeAnimation), with: nil, afterDelay: 4)
    
  }
  
  @objc fileprivate func shakeAnimation(){
    let animation = CAKeyframeAnimation(keyPath: "position")
    
    animation.values = [
      CGPoint(x: 0, y: 0),
      CGPoint(x: -20, y: 0),
      CGPoint(x: 20, y: 0),
      CGPoint(x: -10, y: 0),
      CGPoint(x: 10, y: 0),
      CGPoint(x: -10, y: 0),
      CGPoint(x: 0, y: 0),
    ]
    
    animation.keyTimes = [
      0, 0.1, 0.25, 0.4, 0.6, 0.8, 1
    ]
    
    animation.duration = 0.5
    animation.isAdditive = true
    animation.repeatCount = 20
    imageView.layer.add(animation, forKey: "shakeanimation")
  }
  
  
}
