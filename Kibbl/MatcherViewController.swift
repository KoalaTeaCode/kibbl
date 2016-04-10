//
//  MatcherViewController.swift
//  Kibbl
//
//  Created by Keith Holliday on 4/9/16.
//  Copyright © 2016 Keith Holliday. All rights reserved.
//

import UIKit

class MatcherViewController: UIViewController, DraggableViewDelegate {
    
    var exampleCardLabels = [Pet]()
    
    var loadedCards = [DraggableView]()
    var allCards = [DraggableView]()
    var cardsLoadedIndex = 0;
    var currentIndex = 0
    
    let MAX_BUFFER_SIZE: Int = 6; //%%% max number of cards loaded at any given time, must be greater than 1
    let CARD_HEIGHT: CGFloat = 386; //%%% height of the draggable card
    let CARD_WIDTH: CGFloat = 290; //%%% width of the draggable card
    
    let savedPetsCollection: SavedPetsCollection = SavedPetsCollection.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleCardLabels.append(Pet(name: "Izzy"))
        exampleCardLabels.append(Pet(name: "Pepper"))
        exampleCardLabels.append(Pet(name: "Cici"))
        
        loadCards()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Draggable View Delegate
    func cardSwipedLeft(card: UIView) {
        print(allCards)
        currentIndex += 1
    }
    
    func cardSwipedRight(card: UIView) {
        print(allCards)
        savedPetsCollection.savedPets.append(exampleCardLabels[currentIndex])
        currentIndex += 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Mark - Helpers
    func loadCards() {
        if(exampleCardLabels.count <= 0) {
            return
        }
        
        var numLoadedCardsCap = exampleCardLabels.count
   
        for (var i = 0; i < exampleCardLabels.count; i++) {
            var newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
            allCards.append(newCard);
        
            if (i < numLoadedCardsCap) {
                loadedCards.append(newCard)
            }
        }
    
        for (var i = 0; i < loadedCards.count; i++) {
            if (i > 0) {
                self.view.insertSubview(loadedCards[i] as! UIView, belowSubview: loadedCards[i-1] as! UIView)
            } else {
                self.view.addSubview(loadedCards[i] as UIView)
            }
            self.cardsLoadedIndex += 1
        }
    }
    
    func createDraggableViewWithDataAtIndex(index: Int) -> DraggableView {
        
        let width = (self.view.frame.size.width - CARD_WIDTH)/2
        let height = (self.view.frame.size.height - CARD_HEIGHT)/2
        
        let rectangle = CGRectMake(width, height, CARD_WIDTH, CARD_HEIGHT)
        
        let draggableView: DraggableView = DraggableView(frame: rectangle)
        
        draggableView.information.text = exampleCardLabels[index].name;
        draggableView.delegate = self;
    
        return draggableView;
    }
}
