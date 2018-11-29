//
//  HabitDetailViewController.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/27/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    var habit: Habit!
    var habitIndex: Int!
    
    private var persistance = PersistenceLayer()
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    @IBOutlet weak var labelCurrentSteak: UILabel!
    
    @IBOutlet weak var labelTotalCompletion: UILabel!
    
    @IBOutlet weak var labelBestSteak: UILabel!
    
    @IBOutlet weak var dateStarted: UILabel!
    
    @IBOutlet weak var buttonAction: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func pressActionButton(_ sender: Any) {
        // Line 1
        habit = persistance.markHabitAsCompleted(habitIndex)
        
        // Line 2
        updateUI()
    }
    private func updateUI(){
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        imageViewIcon.contentMode = .scaleAspectFill
        labelCurrentSteak.text = "\(habit.currentStreak) Days"
        labelTotalCompletion.text = String(habit.numberOfCompletions)
        labelBestSteak.text = "\(habit.bestStreak)"
        dateStarted.text = habit.dateCreated.stringValue
        
        if habit.hasCompletedForToday {
            buttonAction.setTitle("Completed for Today", for: .normal)
        }else{
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    
    
}
