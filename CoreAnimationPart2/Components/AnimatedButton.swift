//
//  AnimatedButton.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 03/06/21.
//

import UIKit

class AnimatedButton: UIButton {
  var wAnchor: NSLayoutConstraint?
  var hAnchor: NSLayoutConstraint?
  
  var completion: () -> Void = {}
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    phaseTwo()
    
  }
  
  init(titleButton: String? = nil, completionHandler: @escaping () -> Void = {}){
    super.init(frame: .zero)
    
    self.completion = completionHandler
    
    translatesAutoresizingMaskIntoConstraints = false
    wAnchor = widthAnchor.constraint(equalToConstant: 150)
    wAnchor?.isActive = true
    
    hAnchor = heightAnchor.constraint(equalToConstant: 54)
    hAnchor?.isActive = true
    
    
    phaseTwo(titleButton: titleButton)
  }
  
  fileprivate func phaseTwo(titleButton: String? = nil){
   
    layer.cornerRadius = 12
    backgroundColor = .blue
    setTitle(titleButton ?? "Button", for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    
    addTarget(self, action: #selector(down), for: .touchDown)
    addTarget(self, action: #selector(up), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: Selectors
  
  @objc fileprivate func down(){
    wAnchor?.isActive = false
    hAnchor?.isActive = false
    
    wAnchor?.constant = 190
    hAnchor?.constant = 64
    
    wAnchor?.isActive = true
    hAnchor?.isActive = true
    
    
    UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
      self.superview?.layoutIfNeeded()
    })
    
    
  }
  
  @objc fileprivate func up(){
    wAnchor?.isActive = false
    hAnchor?.isActive = false
    
    wAnchor?.constant = 150
    hAnchor?.constant = 54
    
    wAnchor?.isActive = true
    hAnchor?.isActive = true
    
    UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
      self.superview?.layoutIfNeeded()
    }) { _ in
      self.completion()
    }
    
    
  }
  
}
