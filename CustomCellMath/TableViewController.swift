//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // an array of arrays
    // i.e. [[1, 2, 3, 4], [5, 3, 1, 0], [5, 2, 6, 6]]
    var numbers: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
    }
    
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
    let rowArr = numbers[indexPath.row]
    cell.firstNumberLabel.text = String(rowArr[0])
    cell.secondNumberLabel.text = String(rowArr[1])
    cell.thirdNumberLabel.text = String(rowArr[2])
    cell.fourthNumberLabel.text = String(rowArr[3])
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToMath" {
      let destinationViewController = segue.destination as! DisplayMathViewController
      let selectedIndex = self.tableView.indexPathForSelectedRow?.row
      if let selectedItem = selectedIndex {
        destinationViewController.numbers.append(numbers[selectedItem][0])
        destinationViewController.numbers.append(numbers[selectedItem][1])
        destinationViewController.numbers.append(numbers[selectedItem][2])
        destinationViewController.numbers.append(numbers[selectedItem][3])
      }
    }
  }
}



// MARK: - Generating an array of Data
extension TableViewController {
    
    func generateData() {
        for _ in 1...100 {
            var newNumberRow: [Int] = []
            
            for _ in 1...4 {
                let randomNumber = randomNumberFromOneTo(50)
                newNumberRow.append(randomNumber)
            }
            
            numbers.append(newNumberRow)
        }
    }
    
    func randomNumberFromOneTo(_ number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    
}
