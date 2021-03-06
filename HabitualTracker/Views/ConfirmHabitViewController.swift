//
//  ConfirmHabitViewController.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/27/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    
    var habitImage: Habit.Images!
    
    @IBOutlet weak var habitImageView: UIImageView!
    
    @IBOutlet weak var habitNameInputField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }

    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persisenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else {return}
        persisenceLayer.creatingNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
