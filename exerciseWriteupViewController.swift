//
//  exerciseWriteupViewController.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 3/3/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class exerciseWriteupViewController: UIViewController {
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    //MARK: Attributes
    var workoutName = "No Name"
    var ex1name = "No Name"
    var ex2name = "No Name"
    var ex1weight1 = "Blank"
    var ex1weight2 = "Blank"
    var ex1weight3 = "Blank"
    var ex1reps1 = "Blank"
    var ex1reps2 = "Blank"
    var ex1reps3 = "Blank"
    var ex2weight1 = "Blank"
    var ex2weight2 = "Blank"
    var ex2weight3 = "Blank"
    var ex2weight4 = "Blank"
    var ex2weight5 = "Blank"
    var ex2reps1 = "Blank"
    var ex2reps2 = "Blank"
    var ex2reps3 = "Blank"
    var ex2reps4 = "Blank"
    var ex2reps5 = "Blank"
    
    //MARK: Labels to change
    @IBOutlet weak var ex1nameLabel: UILabel!
    @IBOutlet weak var ex2nameLabel: UILabel!
    @IBOutlet weak var ex1weight1Label: UILabel!
    @IBOutlet weak var ex1reps1Label: UILabel!
    @IBOutlet weak var ex1weight2Label: UILabel!
    @IBOutlet weak var ex1reps2Label: UILabel!
    @IBOutlet weak var ex1weight3Label: UILabel!
    @IBOutlet weak var ex1reps3Label: UILabel!
    @IBOutlet weak var ex2weight1Label: UILabel!
    @IBOutlet weak var ex2weight2Label: UILabel!
    @IBOutlet weak var ex2weight3Label: UILabel!
    @IBOutlet weak var ex2weight4Label: UILabel!
    @IBOutlet weak var ex2weight5Label: UILabel!
    @IBOutlet weak var ex2reps1Label: UILabel!
    @IBOutlet weak var ex2reps2Label: UILabel!
    @IBOutlet weak var ex2reps3Label: UILabel!
    @IBOutlet weak var ex2reps4Label: UILabel!
    @IBOutlet weak var ex2reps5Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Filling vals.
        workoutNameLabel.text = workoutName
        ex1nameLabel.text = ex1name
        ex2nameLabel.text = ex2name
        ex1weight1Label.text = ex1weight1 + " lbs"
        ex1weight2Label.text = ex1weight2 + " lbs"
        ex1weight3Label.text = ex1weight3 + " lbs"
        ex1reps1Label.text = ex1reps1
        ex1reps2Label.text = ex1reps2
        ex1reps3Label.text = ex1reps3
        ex2weight1Label.text = ex2weight1 + " lbs"
        ex2weight2Label.text = ex2weight2 + " lbs"
        ex2weight3Label.text = ex2weight3 + " lbs"
        ex2weight4Label.text = ex2weight4 + " lbs"
        ex2weight5Label.text = ex2weight5 + " lbs"
        ex2reps1Label.text = ex2reps1
        ex2reps2Label.text = ex2reps2
        ex2reps3Label.text = ex2reps3
        ex2reps4Label.text = ex2reps4
        ex2reps5Label.text = ex2reps5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
