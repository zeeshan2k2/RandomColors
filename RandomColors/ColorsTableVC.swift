//
//  ColorsTableVC.swift
//  RandomColours
//
//  Created by Zeeshan Waheed on 24/12/2023.
//

import UIKit

class ColorsTableVC: UIViewController {

    // an array to store all colors
    var colors:[UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()

        // Do any additional setup after loading the view.
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(createRandomColor())
        }
    }
    
    // function that creates a random color
    func createRandomColor() -> UIColor {
        let randomColor = UIColor(red:  CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
    // this function sets background color in ColourCetailsVC swift file
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    // viewing cells equal to the number of length of array i.e if array is of 50
    // length so it'll view 50 cells.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    // sets color of cells to the color corresponding to number of index in the colors array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    // moves screen to next view controller
    // this will also trigger prepare for segue override funciton
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailVC", sender: color)
    }
}
