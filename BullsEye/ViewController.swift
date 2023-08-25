//
//  ViewController.swift
//  BullsEye
//
//  Created by anikin02 on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var slider: UISlider!
  @IBOutlet var scoreLable: UILabel!
  @IBOutlet var roundsLable: UILabel!
  @IBOutlet var validLable: UILabel!
  
  var score: Int = 0
  var rounds: Int = 0
  var validValue: Int = 0
  var currentValue: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }
  
  func startNewRound() {
    validValue = Int.random(in: 0...100)
    currentValue = 50
    slider.value = Float(currentValue)
    rounds += 1
    updateLables()
  }
  
  func startNewGame() {
    score = 0
    rounds = 0
    startNewRound()
  }
  
  func updateLables() {
    scoreLable.text = String(score)
    roundsLable.text = String(rounds)
    validLable.text = String(validValue)
  }
  
  @IBAction func showAlert() {
    let difference: Int = abs(validValue - currentValue)
    var points: Int = 100 - difference
    var title: String
    
    switch difference {
      case 0:
        title = "Perfect!"
        points += 100
      case 1...5:
        title = "You almost had it!"
      case 6...10:
        title = "Pretty good!"
      default:
        title = "Not even close..."
    }
    
    score += points
    let alert = UIAlertController(
      title: title,
      message: """
        The value of the slider is \(currentValue)
        The valid value is \(validValue)
        You scored \(points) points
        """,
      preferredStyle: .alert)
    
    let action = UIAlertAction(
      title: "OK",
      style: .default,
      handler: { _ in self.startNewRound() })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func startOver() {
    startNewGame()
  }
  
  @IBAction func setSliderValue(_ slider: UISlider) {
    currentValue = Int(slider.value)
  }
}

