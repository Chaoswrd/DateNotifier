//
//  ViewController.swift
//  DateNotifier
//
//  Created by Chaosward on 2017-01-28.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController{

    var isGrantedNotificationAccess:Bool = false
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runNotifier()
        setUpScreenLabels()
        
    }
    func setUpScreenLabels(){
        let date = DateInfo()
        let title = date.getTitle()
        let body = date.getWeekday()
        let footer = date.getWeek()
        
        firstLabel.text = title
        secondLabel.text = body
        thirdLabel.text = footer
    }
    
    
    //Fixes notifications
    func runNotifier(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: { (granted,error) in
            self.isGrantedNotificationAccess = granted
        }
        )
        
        let date = DateInfo()
        let title = date.getTitle()
        let body = date.getWeekday()
        let footer = date.getWeek()
        
        if isGrantedNotificationAccess{
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = "\(body). \(footer)"
            content.categoryIdentifier = "message"
       
            var dateComp = DateComponents()
            dateComp.hour = 6
            
            let triggerCal = UNCalendarNotificationTrigger(
                dateMatching: dateComp,
                repeats: true
            )
            
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: triggerCal
            )
            
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

