//
//  AddWorkoutViewController.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 3/1/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit
import CoreData

class AddWorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var workoutTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myWorkouts: [NSManagedObject] = []
    var indexPathHolder = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
        workoutTableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myWorkouts.count
    }
    
    //MARK: Deleting a cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let workout = myWorkouts[indexPath.row]
            context.delete(workout)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                myWorkouts = try context.fetch(Workout.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    
    //MARK: Adding a cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let workout = myWorkouts[indexPath.row]

        if let myName = workout.value(forKeyPath: "name") {
            cell.textLabel?.text = myName as? String
            cell.detailTextLabel?.text = "Workout on: "
            //TODO Insert Date here
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Segue to Writeup
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to the second view controller
        indexPathHolder = indexPath.row
        self.performSegue(withIdentifier: "gotoWriteup", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let exerciseWriteupViewController = segue.destination as? exerciseWriteupViewController{
            // set a variable in the second view controller with the data to pass
            if let workoutName = (myWorkouts[indexPathHolder].value(forKeyPath: "name")) as? String{
                exerciseWriteupViewController.workoutName = workoutName
                
            }
            //MARK: Filling exercise 1
            if let ex1name = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1name")) as? String{
                exerciseWriteupViewController.ex1name = ex1name
            }
            if let ex1reps1 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1reps1")) as? String{
                exerciseWriteupViewController.ex1reps1 = ex1reps1
            }
            if let ex1reps2 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1reps2")) as? String{
                exerciseWriteupViewController.ex1reps2 = ex1reps2
            }
            if let ex1reps3 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1reps3")) as? String{
                exerciseWriteupViewController.ex1reps3 = ex1reps3
            }
            if let ex1weight1 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1weight2")) as? String{
                exerciseWriteupViewController.ex1weight1 = ex1weight1
            }
            if let ex1weight2 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1weight2")) as? String{
                exerciseWriteupViewController.ex1weight2 = ex1weight2
            }
            if let ex1weight3 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex1weight3")) as? String{
                exerciseWriteupViewController.ex1weight3 = ex1weight3
            }
            //MARK: Filling exercise 2
            if let ex2name = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2name")) as? String{
                exerciseWriteupViewController.ex2name = ex2name
            }
            if let ex2reps1 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2reps1")) as? String{
                exerciseWriteupViewController.ex2reps1 = ex2reps1
            }
            if let ex2reps2 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2reps2")) as? String{
                exerciseWriteupViewController.ex2reps2 = ex2reps2
            }
            if let ex2reps3 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2reps3")) as? String{
                exerciseWriteupViewController.ex2reps3 = ex2reps3
            }
            if let ex2reps4 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2reps4")) as? String{
                exerciseWriteupViewController.ex2reps4 = ex2reps4
            }
            if let ex2reps5 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2reps5")) as? String{
                exerciseWriteupViewController.ex2reps5 = ex2reps5
            }
            if let ex2weight1 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2weight1")) as? String{
                exerciseWriteupViewController.ex2weight1 = ex2weight1
            }
            if let ex2weight2 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2weight2")) as? String{
                exerciseWriteupViewController.ex2weight2 = ex2weight2
            }
            if let ex2weight3 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2weight3")) as? String{
                exerciseWriteupViewController.ex2weight3 = ex2weight3
            }
            if let ex2weight4 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2weight4")) as? String{
                exerciseWriteupViewController.ex2weight4 = ex2weight4
            }
            if let ex2weight5 = (myWorkouts[indexPathHolder].value(forKeyPath: "ex2weight5")) as? String{
                exerciseWriteupViewController.ex2weight5 = ex2weight5
            }
            //MARK: Filling Exercise 3
            
        }
        
        
    }

    
    //MARK: Saving a cell
//    func save(name: String) {
//        
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        // 1
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        // 2
//        let entity =
//            NSEntityDescription.entity(forEntityName: "Workout",
//                                       in: managedContext)!
//        
//        let workout = NSManagedObject(entity: entity,
//                                     insertInto: managedContext)
//        
//        // 3
//        workout.setValue(name, forKeyPath: "name")
//        
//        // 4
//        do {
//            try managedContext.save()
//            myWorkouts.append(workout)
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
    
    //MARK: Refreshing data
    func getData() {
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2 & 3
        do {
            myWorkouts = try managedContext.fetch(Workout.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
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
