//
//  ViewController.swift
//  BullsEye
//
//  Created by anikin02 on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func showAlert() {
    let alert = UIAlertController(
      title: "Hello world!",
      message: "This is my first App",
      preferredStyle: .alert)
    
    let action = UIAlertAction(
      title: "Awesome",
      style: .default,
      handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}

