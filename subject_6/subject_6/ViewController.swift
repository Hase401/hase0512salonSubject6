//
//  ViewController.swift
//  subject_6
//
//  Created by 長谷川孝太 on 2021/05/12.
//

import UIKit

class ViewController: UIViewController {
    private var randomNumber = RandomNumberGenerator().generate()

    @IBOutlet private weak var randomNumberLabel: UILabel!
    @IBOutlet private weak var scaleSlider: UISlider!
    @IBOutlet private weak var minimumNumberLabel: UILabel!
    @IBOutlet private weak var maximumNumberLabel: UILabel!
    @IBAction private func markScaleButton(_ sender: UIButton) {
        let sliderValue = Int(scaleSlider.value)

        if sliderValue == randomNumber {
            presentAlert(message: "あたり！ \n あなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "はずれ！ \n あなたの値: \(sliderValue)")
        }
    }
    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        alertController.addAction(
            UIAlertAction(
                title: "再挑戦",
                style: .default,
                handler: { [weak self] _ in
                    self?.resetRandomNumber()
                }
            )
        )
        present(alertController, animated: true, completion: nil)
    }

    private func resetRandomNumber() {
        randomNumber = RandomNumberGenerator().generate()
        randomNumberLabel.text = String(randomNumber)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumberLabel.text = String(randomNumber)
    }
}

private struct RandomNumberGenerator {
    func generate() -> Int {
        Int(arc4random_uniform(100))
    }
}
