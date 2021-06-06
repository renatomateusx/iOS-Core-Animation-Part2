//
//  AnimationElevenViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 06/06/21.
//

import UIKit

class AnimationElevenViewController: UIViewController {

  //MARK: Properties
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Now, just tap on button"
    label.textAlignment = .center
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = AnimatedButton(titleButton: "Add to cart") {
      self.handleToCart()
    }
    button.backgroundColor = .darkGray
    return button
  }()
  
  private lazy var notificaton: UIView = {
    let view = UIView()
    
    return view
  }()
  
  var notificationBottom : NSLayoutConstraint!
  
  var yAnchor: NSLayoutConstraint!
  var widthAnchor: NSLayoutConstraint!
  var heightAnchor: NSLayoutConstraint!
  
  //MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTabBar()
    configureView()
    setupNotification()
  }
  
  
  //MARK: Helpers
  func configureTabBar(){
    navigationController?.navigationBar.isHidden = false
  }
  
  func configureView(){
    view.backgroundColor = .white
    view.addSubview(label)
    label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -160).isActive = true
    label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    view.addSubview(button)
    button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
  
  }
  
  fileprivate func setupNotification(){
    let notilabel = UILabel()
    notilabel.translatesAutoresizingMaskIntoConstraints = false
    notilabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    notilabel.textColor = .white
    notilabel.text = "Added to card"
    
    view.addSubview(notificaton)
    notificaton.backgroundColor = .lightGray
    notificaton.translatesAutoresizingMaskIntoConstraints = false
    notificaton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    notificaton.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    notificationBottom = notificaton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40)
    notificationBottom.isActive = true
    
    notificaton.addSubview(notilabel)
    notilabel.leftAnchor.constraint(equalTo: notificaton.leftAnchor, constant: 20).isActive = true
    notilabel.centerYAnchor.constraint(equalTo: notificaton.centerYAnchor).isActive = true
    
    
  }
  
  //MARK: Selectors
  
  @objc func handleToCart(){
    notificationBottom.constant = -40
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
      self.view.layoutIfNeeded()
    }) { (complete) in
      if complete {
        self.notificationBottom.constant = 40
        UIView.animate(withDuration: 0.5, delay: 1.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
          self.view.layoutIfNeeded()
        })

      }
    }

  }

}
