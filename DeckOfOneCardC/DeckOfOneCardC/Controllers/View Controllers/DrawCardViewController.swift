//
//  DrawCardViewController.swift
//  DeckOfOneCardC
//
//  Created by Jordan Bryant on 9/29/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class DrawCardViewController: UIViewController {
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawButton.layer.masksToBounds = true
        drawButton.layer.cornerRadius = 30
    }

    private func updateViews(card: JDBCard) {
        cardLabel.text = "\(card.value) of \(card.suit)"
        
        JDBCardController.shared().fetchCardImage(card) { (image) in
            if let image = image {
                self.cardImageView.image = image
            }
        }
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        JDBCardController.shared().drawNewCard(1) { (cards) in
            if let cards = cards, let card = cards.first {
                self.updateViews(card: card)
            }
        }
    }
    
    
}
