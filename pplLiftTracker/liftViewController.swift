//
//  liftViewController.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 2/2/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit
import CoreData

class liftViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var saveWorkout: UIButton!
    
    //MARK: Parts of the workout
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var ex1name: UITextField!
    @IBOutlet weak var ex2name: UITextField!
    @IBOutlet weak var ex3name: UITextField!
    @IBOutlet weak var ex1weight1: UITextField!
    @IBOutlet weak var ex1weight2: UITextField!
    @IBOutlet weak var ex1weight3: UITextField!
    @IBOutlet weak var ex1reps1: UITextField!
    @IBOutlet weak var ex1reps2: UITextField!
    @IBOutlet weak var ex1reps3: UITextField!
    @IBOutlet weak var ex2weight1: UITextField!
    @IBOutlet weak var ex2weight2: UITextField!
    @IBOutlet weak var ex2weight3: UITextField!
    @IBOutlet weak var ex2weight4: UITextField!
    @IBOutlet weak var ex2weight5: UITextField!
    @IBOutlet weak var ex2reps1: UITextField!
    @IBOutlet weak var ex2reps2: UITextField!
    @IBOutlet weak var ex2reps3: UITextField!
    @IBOutlet weak var ex2reps4: UITextField!
    @IBOutlet weak var ex2reps5: UITextField!
    @IBOutlet weak var ex3weight1: UITextField!
    @IBOutlet weak var ex3weight2: UITextField!
    @IBOutlet weak var ex3weight3: UITextField!
    @IBOutlet weak var ex3weight4: UITextField!
    @IBOutlet weak var ex3weight5: UITextField!
    @IBOutlet weak var ex3reps1: UITextField!
    @IBOutlet weak var ex3reps2: UITextField!
    @IBOutlet weak var ex3reps3: UITextField!
    @IBOutlet weak var ex3reps4: UITextField!
    @IBOutlet weak var ex3reps5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let workout = Workout(context: context)
        workout.name = workoutName.text
        workout.ex1name = ex1name.text
        workout.ex1reps1 = ex1reps1.text
        workout.ex1reps2 = ex1reps2.text
        workout.ex1reps3 = ex1reps3.text
        workout.ex1weight1 = ex1weight1.text
        workout.ex1weight2 = ex1weight2.text
        workout.ex1weight3 = ex1weight3.text
        workout.ex2name = ex2name.text
        workout.ex2reps1 = ex2reps1.text
        workout.ex2reps2 = ex2reps2.text
        workout.ex2reps3 = ex2reps3.text
        workout.ex2reps4 = ex2reps4.text
        workout.ex2reps5 = ex2reps5.text
        workout.ex2weight1 = ex2weight1.text
        workout.ex2weight2 = ex2weight2.text
        workout.ex2weight3 = ex2weight3.text
        workout.ex2weight4 = ex2weight4.text
        workout.ex2weight5 = ex2weight5.text
        workout.ex3name = ex3name.text
        workout.ex3reps1 = ex3reps1.text
        workout.ex3reps2 = ex3reps2.text
        workout.ex3reps3 = ex3reps3.text
        workout.ex3reps4 = ex3reps4.text
        workout.ex3reps5 = ex3reps5.text
        workout.ex3weight1 = ex3weight1.text
        workout.ex3weight2 = ex3weight2.text
        workout.ex3weight3 = ex3weight3.text
        workout.ex3weight4 = ex3weight4.text
        workout.ex3weight5 = ex3weight5.text
        // Save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
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
