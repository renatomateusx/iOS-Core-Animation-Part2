//
//  AnimationFiveViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 04/06/21.
//

import UIKit

class AnimationSixViewController: UIViewController {

  
  //MARK: Properties
  fileprivate lazy var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "maxwell-nelson-2"))
  
  fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
  
  fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
  
  
  var yAnchor: NSLayoutConstraint!
  var widthAnchor: NSLayoutConstraint!
  var heightAnchor: NSLayoutConstraint!
  
  
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
   
    
    self.setupCABasic()
        
  }
  
  fileprivate func setupCABasic(){
    let basic0 = CABasicAnimation(keyPath: "transform.scale")
    basic0.toValue = 0.5
    basic0.duration = 2
    
    imageView.layer.add(basic0,forKey: "renatomateusx.io")
    blurView.layer.add(basic0,forKey: "renatomateusx.io")
    
    let basic1 = CABasicAnimation(keyPath: "cornerRadius")
    basic1.toValue = 50
    basic1.duration = 2
    
    imageView.layer.add(basic1,forKey: "renatomateusx.io/cabasicanimation")
    blurView.layer.add(basic1,forKey: "renatomateusx.io/cabasicanimation")
    
    
    let basic2 = CABasicAnimation(keyPath: "opacity")
    basic2.toValue = 0
    basic2.duration = 2
    
    blurView.layer.add(basic2,forKey: "renatomateusx.io/cabasicanimation/opacity")
  }
  
  //MARK: Selectors
  
 


}
