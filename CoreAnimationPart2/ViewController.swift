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
    let button = createButton(title: "Images Animation")
    button.addTarget(self, action: #selector(animationOneTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnTwo: UIButton = {
    let button = createButton(title: "Square Animation")
    button.addTarget(self, action: #selector(animationTwoTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnThree: UIButton = {
    let button = createButton(title: "Button Animation")
    button.addTarget(self, action: #selector(animationThreeTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnFour: UIButton = {
    let button = createButton(title: "Property Animation")
    button.addTarget(self, action: #selector(animationFourTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnFive: UIButton = {
    let button = createButton(title: "CGAffine Animation")
    button.addTarget(self, action: #selector(animationFiveTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnSix: UIButton = {
    let button = createButton(title: "CABasic Animation")
    button.addTarget(self, action: #selector(animationSixTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnSeven: UIButton = {
    let button = createButton(title: "CASpring Animation")
    button.addTarget(self, action: #selector(animationSevenTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var btnEight: UIButton = {
    let button = createButton(title: "CAGradient Animation")
    button.addTarget(self, action: #selector(animationEightTapped), for: .touchUpInside)
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
    scroll.addSubview(btnFour)
    scroll.addSubview(btnFive)
    scroll.addSubview(btnSix)
    scroll.addSubview(btnSeven)
    scroll.addSubview(btnEight)
    
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
      
      btnFour.topAnchor.constraint(equalTo: btnThree.bottomAnchor, constant: 20),
      btnFour.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnFour.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnFour.heightAnchor.constraint(equalToConstant: 42),
      btnFour.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      
      btnFive.topAnchor.constraint(equalTo: btnFour.bottomAnchor, constant: 20),
      btnFive.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnFive.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnFive.heightAnchor.constraint(equalToConstant: 42),
      btnFive.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      
      btnSix.topAnchor.constraint(equalTo: btnFive.bottomAnchor, constant: 20),
      btnSix.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnSix.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnSix.heightAnchor.constraint(equalToConstant: 42),
      btnSix.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      btnSeven.topAnchor.constraint(equalTo: btnSix.bottomAnchor, constant: 20),
      btnSeven.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnSeven.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnSeven.heightAnchor.constraint(equalToConstant: 42),
      btnSeven.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
      btnEight.topAnchor.constraint(equalTo: btnSeven.bottomAnchor, constant: 20),
      btnEight.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 10),
      btnEight.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -10),
      btnEight.heightAnchor.constraint(equalToConstant: 42),
      btnEight.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
      
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
  
  @objc func animationFourTapped(){
    navigationController?.pushViewController(AnimationFourViewController(), animated: true)
  }
  
  @objc func animationFiveTapped(){
    navigationController?.pushViewController(AnimationFiveViewController(), animated: true)
  }
  
  @objc func animationSixTapped(){
    navigationController?.pushViewController(AnimationSixViewController(), animated: true)
  }
  
  @objc func animationSevenTapped(){
    navigationController?.pushViewController(AnimationSevenViewController(), animated: true)
  }
  
  @objc func animationEightTapped(){
    navigationController?.pushViewController(AnimationEightViewController(), animated: true)
  }
  
  
}

