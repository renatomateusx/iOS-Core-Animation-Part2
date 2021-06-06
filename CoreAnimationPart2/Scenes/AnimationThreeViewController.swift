//
//  AnimationThreeViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 03/06/21.
//

import UIKit

class AnimationThreeViewController: UIViewController {
  
  
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
    let button = AnimatedButton(titleButton: "Button One") {
      self.buttonOneTapped()
    }
    return button
  }()
  
  private lazy var buttonTwo: AnimatedButton = {
    let button = AnimatedButton(titleButton: "Button Two") {
      self.buttonTwoTapped()
    }
    return button
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
    
    
    view.addSubview(button)
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    view.addSubview(buttonTwo)
    buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    buttonTwo.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40).isActive = true
    
  }

  //MARK: Selectors
  
  @objc func buttonOneTapped(){
    print("Btn One Tapped")
  }
    
  @objc func buttonTwoTapped(){
    print("Btn Two Tapped")
  }
  
}
