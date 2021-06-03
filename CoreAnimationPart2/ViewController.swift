//
//  ViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 31/05/21.
//

import UIKit

class ViewController: UIViewController {
  // MARK: Properties
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Animation List"
    label.textAlignment = .center
    return label
  }()
  
  private lazy var scroll: UIScrollView = {
    let scroll = UIScrollView()
    scroll.backgroundColor = .clear
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }()
  
  private lazy var btnOne:UIButton = {
    let button = createButton(title: "Animation One")
    button.addTarget(self, action: #selector(animationOneTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnTwo: UIButton = {
    let button = createButton(title: "Animation Two")
    button.addTarget(self, action: #selector(animationTwoTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnThree: UIButton = {
    let button = createButton(title: "Animation Three")
    button.addTarget(self, action: #selector(animationThreeTapped), for: .touchUpInside)
    return button
  }()
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
    configureView()
  }
  
  
  // MARK: Helpers
  func configureTabBar(){
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
  }
  func configureView(){
    view.backgroundColor = .white
    
    view.addSubview(label)
    view.addSubview(scroll)
    scroll.addSubview(btnOne)
    scroll.addSubview(btnTwo)
    scroll.addSubview(btnThree)
    
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      scroll.topAnchor.constraint(equalTo: label.bottomAnchor),
      scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      
      
      
      btnOne.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
      btnOne.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnOne.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnOne.heightAnchor.constraint(equalToConstant: 42),
      btnOne.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      
      btnTwo.topAnchor.constraint(equalTo: btnOne.bottomAnchor, constant: 20),
      btnTwo.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnTwo.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnTwo.heightAnchor.constraint(equalToConstant: 42),
      btnTwo.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      btnThree.topAnchor.constraint(equalTo: btnTwo.bottomAnchor, constant: 20),
      btnThree.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnThree.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnThree.heightAnchor.constraint(equalToConstant: 42),
      btnThree.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
    ])
  }
  
  func createButton(title:String? = nil, image:UIImage? = nil) -> UIButton{
    let button = UIButton(type: .custom)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.backgroundColor = .lightGray
    button.layer.cornerRadius = 5
    if let title = title {
      button.setTitle(title, for: .normal)
    }
    if let image = image {
      button.setImage(image, for: .normal)
    }
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
  
  
  // MARK: Selectors
  @objc func animationOneTapped(){
    navigationController?.pushViewController(AnimationOneViewController(), animated: true)
  }
  
  @objc func animationTwoTapped(){
    navigationController?.pushViewController(AnimationTwoViewController(), animated: true)
  }
  
  @objc func animationThreeTapped(){
    navigationController?.pushViewController(AnimationThreeViewController(), animated: true)
  }
  
}
