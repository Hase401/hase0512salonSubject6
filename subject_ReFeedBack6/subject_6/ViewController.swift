//
//  ViewController.swift
//  subject_6
//
//  Created by 長谷川孝太 on 2021/05/12.
//

import UIKit

class ViewController: UIViewController {
    private var randomNumber: Int!

    @IBOutlet private weak var randomNumberLabel: UILabel!
    @IBOutlet private weak var scaleSlider: UISlider!
    @IBAction private func markScaleButton(_ sender: UIButton) {
        let sliderValue = Int(scaleSlider.value)
        if sliderValue != randomNumber {
            presentAlert(message: "はずれ！ \n あなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "あたり！ \n あなたの値: \(sliderValue)")
        }
    }
    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        alertController.addAction(
            UIAlertAction(
                title: "再挑戦",
                style: .default,
                handler: { [self](_) in
                    self.resetRandomNumber()
                }
            )
        )
        present(alertController, animated: true, completion: nil)
    }
    private func resetRandomNumber() {
        scaleSlider.value = 50
        randomNumber = Int(arc4random_uniform(100)) + 1
        randomNumberLabel.text = String(randomNumber)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resetRandomNumber()
    }
}
