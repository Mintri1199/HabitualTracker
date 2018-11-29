//
//  AddhabitViewController.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/26/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class AddhabitViewController: UIViewController {
    let habitImages = Habit.Images.allCases
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBAction func pickPhotoButtonPressed(_ sender: UIButton) {
        guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let confirmaHabitVC =  ConfirmHabitViewController.instantiate()
        confirmaHabitVC.habitImage = habitImages[selectedIndexPath.row]
        navigationController?.pushViewController(confirmaHabitVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(HabitImageCollectionViewCell.nib, forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
        collectionView.allowsMultipleSelection = false
        setupNavBar()
    }
    
    func setupNavBar() {
        title = "Select Image"
    
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_ :)))
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension AddhabitViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitImageCollectionViewCell.identifier, for: indexPath) as! HabitImageCollectionViewCell
        cell.setImage(image: habitImages[indexPath.row].image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        
        return CGSize(width: collectionViewWidth/4, height: collectionViewWidth/4)
    }
    // Create a border to indicate selected state
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.layer.borderWidth = 2
        cell?.layer.borderColor = UIColor.yellow.cgColor
    }
    
    // Get rid of the border if the cell is not selected
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
    }
    
}
