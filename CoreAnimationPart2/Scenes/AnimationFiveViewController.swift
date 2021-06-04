//
//  AnimationFiveViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 04/06/21.
//

import UIKit

class AnimationFiveViewController: UIViewController {

  
  //MARK: Properties
  
  fileprivate lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Now, just tap on square"
    label.textAlignment = .center
    return label
  }()
  
  fileprivate lazy var viewTap: UIButton = {
    let btn = UIButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("Click here", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.backgroundColor = .red
    btn.addTarget(self, action: #selector(self.animateBox), for: .touchUpInside)
    return btn
  }()
  
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
    
    view.addSubview(viewTap)
    viewTap.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    viewTap.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    viewTap.widthAnchor.constraint(equalToConstant: 100).isActive = true
    viewTap.heightAnchor.constraint(equalToConstant: 45).isActive = true
    viewTap.layer.cornerRadius = 6
        
  }
  
  //MARK: Selectors
  
  var doneAlready:Bool = false
  
  @objc fileprivate func animateBox(){
    if(!doneAlready){
      UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
        var transform = CGAffineTransform.identity
        
        transform = transform.scaledBy(x: 3.6, y: 1)
        self.viewTap.transform = transform
        self.doneAlready = true
        
      }) { _ in
        self.viewTap.setTitle("Now you know!", for: .normal)
      }
    }
    else {
      UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
        var transform = CGAffineTransform.identity
        
        transform = transform.scaledBy(x: 1, y: 1)
        self.viewTap.transform = transform
        self.doneAlready = false
        
      }) { _ in
        self.viewTap.setTitle("Click Here", for: .normal)
      }
    }

  }


}
