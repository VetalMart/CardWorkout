//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Віталій Мартиненко on 23.01.2024.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var CardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 9
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
   
    }
        
    @objc func showRandomImage() {
        CardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
 
    }
        
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
        
    }
}
