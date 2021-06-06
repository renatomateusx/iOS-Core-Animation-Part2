//
//  AnimationTenViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 06/06/21.
//

import UIKit

class AnimationTenViewController: UIViewController {

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
   
    self.blurView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    setupUIViewAnimateKeyFrame()
    
  }
  
  fileprivate func setupUIViewAnimateKeyFrame(){
    let center = self.imageView.center
  
    UIView.animateKeyframes(withDuration: 8, delay: 0, options: .calculationModeCubic, animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
        self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
      })
      
      
      UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3, animations: {
        self.imageView.center = CGPoint(x: center.x + 100, y: center.y + 100)
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3, animations: {
        self.imageView.center = CGPoint(x: center.x - 100, y: center.y - 100)
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: {
        self.imageView.center = CGPoint(x: center.x + 100, y: center.y - 100)
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
        self.imageView.center = center
      })
      
    })

  }

}
