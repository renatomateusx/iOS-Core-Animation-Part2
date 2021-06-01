//
//  AnimationTwoViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 01/06/21.
//

import UIKit

class AnimationTwoViewController: UIViewController {
  
  
  //MARK: Properties
  
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Now, just tap on orange square"
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  private lazy var viewSquare: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
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
    view.addSubview(label)
    label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    
    view.addSubview(viewSquare)
    
    yAnchor = viewSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    yAnchor.isActive = true
    
    viewSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    heightAnchor = viewSquare.heightAnchor.constraint(equalToConstant: 200)
    heightAnchor.isActive = true
    
    
    widthAnchor = viewSquare.widthAnchor.constraint(equalToConstant: 200)
    widthAnchor.isActive = true
    
    perform(#selector(animateBox), with: nil, afterDelay: 1)
    
    viewSquare.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOnTap)))
    
  }
  
  
  
  
  
  //MARK: Selectors
  
  @objc func animateBox(){
    yAnchor.isActive = false
    yAnchor = viewSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10)
    yAnchor.isActive = true
    
    widthAnchor.isActive = false
    widthAnchor = viewSquare.widthAnchor.constraint(equalToConstant: 300)
    widthAnchor.isActive = true
    
    heightAnchor.isActive = false
    heightAnchor = viewSquare.heightAnchor.constraint(equalToConstant: view.frame.height - 140)
    heightAnchor.isActive = true
    
    
    
    UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
      self.view.layoutIfNeeded()
    }) { _ in
      UIView.animate(withDuration: 0.7) {
        self.label.alpha = 1
      }
    }
    
  }
  
  var tapped: Bool = false
  var tappedAlready: Bool = false
  @objc func animateOnTap(){
    
    if tapped {
      widthAnchor.isActive = false
      widthAnchor = viewSquare.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
      widthAnchor.isActive = true
      tappedAlready = true
    } else{
      yAnchor.isActive = false
      yAnchor = viewSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 160)
      yAnchor.isActive = true
      
      widthAnchor.isActive = false
      widthAnchor = viewSquare.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
      widthAnchor.isActive = true
      
      heightAnchor.isActive = false
      heightAnchor = viewSquare.heightAnchor.constraint(equalToConstant: 200)
      heightAnchor.isActive = true
    }
    tapped = !tapped
    
    UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations:  {
      self.view.layoutIfNeeded()
    }) { _ in
      UIView.animate(withDuration: 0.7) {
        if !self.tappedAlready {
          self.label.text = "Tap again!"
        }
        else {
          self.label.text = "And again!"
        }
      }
    }
  }
  
}
