//
//  GoalTableViewController.swift
//  Github Practice
//
//  Created by Mariana Chavez on 7/21/21.
//

import UIKit

class GoalTableViewController: UITableViewController {
    var goals: [GoalCD] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getGoals()
    }
    func getGoals() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataGoals = try? context.fetch(GoalCD.fetchRequest()) as? [GoalCD] {
                goals = coreDataGoals
                tableView.reloadData()
            }
        }
    }
    
    // no longer need createGoals function since we want goals to be able to be changed by users
//    func createGoals() -> [Goal] {
//        let swift = Goal()
//        swift.name = "Learn Swift"
//
//
//        let laundry = Goal()
//        laundry.name = "Do the laundry"
//        // important is set to false by default
//
//        return [swift, laundry]
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let goal = goals[indexPath.row]

        cell.textLabel?.text = goal.name

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //MORE CHANGE from lines 96-99
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let addVC = segue.destination as? AddGoalViewController {
        // Pass the selected object to the new view controller.
            addVC.previousVC = self
        }
    
        if let completeVC = segue.destination as? CompleteGoalViewController {
            if let goal = sender as? GoalCD {
              completeVC.selectedGoal = goal
              completeVC.previousVC = self
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let goal = goals[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: goal)
    }


}
