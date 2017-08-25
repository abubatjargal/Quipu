//
//  HistoryViewController.swift
//  Quipu
//
//  Created by Abu Batjargal on 8/24/17.
//  Copyright © 2017 Abu Batjargal. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var historyTableView: UITableView!
    
    var history = [HistoryItem]()
    
    @IBOutlet var dateText: UILabel!
    @IBOutlet var addressText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.dataSource = self;
        historyTableView.delegate = self;
        populateHistory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell");
        cell?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 90)
        let cellDate =  UILabel(frame: CGRect(x: 20, y: 0, width: (cell?.frame.width)!, height: 45))
        let cellWeight = UILabel(frame: CGRect(x: 20, y: 45, width: (cell?.frame.width)!, height: 45))
        cellDate.text = history[indexPath.row].date
        cellWeight.text = history[indexPath.row].weight
        cellDate.textColor = UIColor.white
        cellWeight.textColor = UIColor.white
        cell?.addSubview(cellDate)
        cell?.addSubview(cellWeight)
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count;
    }
    
    func populateHistory() {
        history.append(HistoryItem.init(
            date: "June 14, 2017",
            address: "76 Brattle St, Boston 02423",
            weight: "17 lbs"
        ))
        history.append(HistoryItem.init(
            date: "June 29, 2017",
            address: "76 Brattle St, Boston 02423",
            weight: "14 lbs"
        ))
        history.append(HistoryItem.init(
            date: "July 12, 2017",
            address: "76 Brattle St, Boston 02423",
            weight: "18 lbs"
        ))
        history.append(HistoryItem.init(
            date: "July 27, 2017",
            address: "26 Charles St, Cambridge 02159",
            weight: "26 lbs"
        ))
        history.append(HistoryItem.init(
            date: "August 18, 2017",
            address: "76 Brattle St, Boston 02423",
            weight: "12 lbs"
        ))
        
    }
    

}
