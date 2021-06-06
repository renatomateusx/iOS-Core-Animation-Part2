//
//  AnimationFourViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 04/06/21.
//


import UIKit

class   AnimationFourViewController: UIViewController {
  
  
  //MARK: Properties
  
  fileprivate lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Now, just tap on button"
    label.textAlignment = .center
    return label
  }()
  
  fileprivate lazy var slider: UISlider = {
    let slider = UISlider()
    slider.translatesAutoresizingMaskIntoConstraints = false
    
    slider.addTarget(self, action: #selector(handleSlider(slide:)), for: .allEvents)
    return slider
  }()
  
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
  
  override func viewWillDisappear(_ animated: Bool) {
    animator.stopAnimation(true)
    animator.finishAnimation(at: .current)
  }
  
  
  //MARK: Helpers
  func configureTabBar(){
    navigationController?.navigationBar.isHidden = false
  }
  func configureView(){
    view.backgroundColor = .white
    view.addSubview(label)
    label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    view.addSubview(imageView)
    imageView.frame = view.frame
    imageView.contentMode = .scaleAspectFill
    
    view.addSubview(blurView)
    blurView.frame = view.frame
    blurView.alpha = 0.5
    
    
    view.addSubview(slider)
    
    slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    slider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150).isActive = true
    
    animator.addAnimations {
      self.blurView.alpha = 1
      self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
   
    
  }
  
  //MARK: Selectors
  
  @objc fileprivate func handleSlider(slide: UISlider){
    animator.fractionComplete = CGFloat(slide.value)
  }

}
