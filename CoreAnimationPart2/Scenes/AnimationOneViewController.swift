//
//  AnimationOneViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 01/06/21.
//

import UIKit

class AnimationOneViewController: UIViewController {
  
  
  //MARK: Properties
  
  var spriteImages = [UIImage]()
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Click on the heart image"
    label.textAlignment = .center
    return label
  }()
  
  lazy var image: UIImageView = {
    let image = UIImageView()
    image.isUserInteractionEnabled = true
    image.image = UIImage(named: "tile00")
    image.translatesAutoresizingMaskIntoConstraints = false
    image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animate)))
    return image
  }()
  
  
  
  //MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTabBar()
    configureImages()
    configureView()
  }
  
  
  //MARK: Helpers
  func configureTabBar(){
    navigationController?.navigationBar.isHidden = false
  }
  func configureView(){
    view.backgroundColor = .white
    view.addSubview(label)
    view.addSubview(image)
    
    label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    image.heightAnchor.constraint(equalToConstant: 100).isActive = true
    image.widthAnchor.constraint(equalToConstant: 100).isActive = true
    image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  func configureImages(){
    for i in 0 ..< 29 {
      spriteImages.append(UIImage(named: "tile0\(i)")!)
    }
  }
  
  
  
  
  //MARK: Selectors
  @objc func animate(){
    image.animationImages = spriteImages
    image.animationDuration = 0.6
    image.animationRepeatCount = 1
    image.startAnimating()
  }
}
