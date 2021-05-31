//
//  ViewController.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 31/05/21.
//

import UIKit

class ViewController: UIViewController {
  // MARK: Properties
  
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
    
  }
  
}

