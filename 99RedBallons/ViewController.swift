//
//  ViewController.swift
//  99RedBallons
//
//  Created by Jacky Poon on 2014-11-04.
//  Copyright (c) 2014 jacsdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainImageLabel: UILabel!
    
    var listOfBalloons:[Balloon] = []
    var listOfImages:[String] = ["RedBalloon1.jpg","RedBalloon2.jpg","RedBalloon3.jpg","RedBalloon4.jpg"]
    var currentIndex:Int = 0
    
    func setupBalloonArray()
    {
        for var i=0; i<99; i++ {
            let randomNumber = Int(arc4random_uniform(UInt32(3)))
            // not too sure why the default initializer does not work and need to explicitely state
            //var currentBalloon = Balloon(image: UIImage(named: listOfImages[randomNumber]), number: i)
            var currentBalloon = Balloon()
            currentBalloon.number = i
            currentBalloon.image = UIImage(named: listOfImages[randomNumber])
            listOfBalloons.append(currentBalloon)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = UIImage(named: "BerlinTVTower.jpg")
        // Do any additional setup after loading the view, typically from a nib.
        setupBalloonArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        println("Next Pressed: " + "\(currentIndex)")
        if currentIndex >= 99
        {
            currentIndex = 0
        }
        mainImageView.image = listOfBalloons[currentIndex].image
        mainImageLabel.text = "Balloon: " + "\(listOfBalloons[currentIndex].number)"
        currentIndex++
        
    }
}

