//
//  AddGoalViewController.swift
//  Github Practice
//
//  Created by Mariana Chavez on 7/21/21.
//

import UIKit

class AddGoalViewController: UIViewController {
    
    var goals : [Goal] = []
    //another change
    var previousVC = GoalTableViewController()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var meaningTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            // we are creating a new ToDoCD object here, naming it toDo
            let goal = GoalCD(entity: GoalCD.entity(), insertInto: context)

            // if the titleTextField has text, we will call that text titleText
            if let nameText = nameTextField.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                goal.name = nameText
                goal.meaning = //UNSURE
            }

            try? context.save()

            navigationController?.popViewController(animated: true)
          }

        
       /* let goal = Goal()
        
        if let nameText = nameTextField.text {
            goal.name = nameText
        //I AM UNSURE OF THIS CODE - change made since I last worked with group
        if let meaningText = meaningTextField.text{
            goal.meaning = meaningText
            }
        }
        previousVC.goals.append(goal)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true) */
 
    }
   
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let goal = goals[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: goal)
    }
    
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddGoalViewController {
        addVC.previousVC = self
      }
    }
 */

     
       /* if let completeVC = segue.destination as? CompleteGoalViewController {
        if let toDo = sender as? Goal {
          completeVC.selectedGoal = goal
          completeVC.previousVC = self
        }
      }
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} 
