//
//  TableViewController.swift
//  SwiftyJSONProkect
//
//  Created by Павел Анплеенко on 19/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {
	
	var cities = ["Minsk", "Madrid", "Riga"]
	var weather: [String] = []

	override func viewDidLoad() {
					super.viewDidLoad()
		
		getJSONData();
		
	}

	func getJSONData() {
		let file = NSBundle.mainBundle().pathForResource("JSONData", ofType: "json") as String!
		let data = NSData(contentsOfFile: file)! as NSData
		
		let clearJSON = JSON(data: data, options: NSJSONReadingOptions.MutableContainers, error: nil)
		
		let numberEuropeCities = clearJSON["Europe"].count
		
		for i in 0..<numberEuropeCities{
			weather.append(clearJSON["Europe"]["cities"][i]["weather"].string!)
		}
	}

	override func didReceiveMemoryWarning() {
					super.didReceiveMemoryWarning()
					// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
					// #warning Incomplete implementation, return the number of sections
					return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
					// #warning Incomplete implementation, return the number of rows
					return cities.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		cell.textLabel?.text = "Europe: \(weather[indexPath.row]), \(cities[indexPath.row])"
		return cell
	}

	/*
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
					// Return false if you do not want the specified item to be editable.
					return true
	}
	*/

	/*
	// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
					if editingStyle == .Delete {
									// Delete the row from the data source
									tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
					} else if editingStyle == .Insert {
									// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
					}    
	}
	*/

	/*
	// Override to support rearranging the table view.
	override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

	}
	*/

	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
					// Return false if you do not want the item to be re-orderable.
					return true
	}
	*/

	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
					// Get the new view controller using segue.destinationViewController.
					// Pass the selected object to the new view controller.
	}
	*/

}
