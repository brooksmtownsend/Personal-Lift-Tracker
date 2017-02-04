//
//  workoutViewController.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 2/4/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit
import CoreData

class workoutViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var workoutTableView: UITableView!
    var workouts = [NSManagedObject]()
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            workoutTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let workout = workouts[indexPath.row]
        
        cell!.textLabel!.text =
            workout.value(forKey: "name") as? String
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            workouts = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addWorkout(_ sender: Any) {
        
        let alert = UIAlertController(title: "New workout",
                                      message: "Add a new workout",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.saveName(name: textField!.text!)
                                        self.workoutTableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    func saveName(name: String) {
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "Workout",
                                                 in:managedContext)
        
        let workout = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        
        //3
        workout.setValue(name, forKey: "name")
        
        //4
        do {
            try managedContext.save()
            //5
            workouts.append(workout)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\"Workout List\""
        
        workoutTableView.register(
            UITableViewCell.self,
            
            forCellReuseIdentifier: "Cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
