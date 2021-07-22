//
//  MilestoneTableViewController.swift
//  Github Practice
//
//  Created by Megan on 7/21/21.
//

import UIKit

class MilestoneTableViewController: UITableViewController {

    var milestones: [MilestoneCD] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMilestones()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMilestones()
    }
    
    func getMilestones() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataMilestones = try? context.fetch(MilestoneCD.fetchRequest()) as? [MilestoneCD] {
                milestones = coreDataMilestones
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return milestones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierMilestone", for: indexPath)

        let milestone = milestones[indexPath.row]
        cell.textLabel?.text = milestone.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let milestone = milestones[indexPath.row]
        
        performSegue(withIdentifier: "moveToCompleteMilestone", sender: milestone)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddMilestoneViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteMilestoneViewController {
            if let milestone = sender as? MilestoneCD {
                completeVC.selectedMilestone = milestone
                completeVC.previousVC = self
            }
        }
    }

}
