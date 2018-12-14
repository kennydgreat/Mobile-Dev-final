//
//  SeeReservationsViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SeeReservationsViewController: UIViewController {

    
    //MARK: Outlets
    @IBOutlet weak var textField: UITextView!
    
    
    // MARK: Firebase variables
    var db:Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("You are on the see reservations screen")
        
        db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
         let songsRef = db.collection("advisors")
        songsRef.getDocuments() {
            (snapshot, error) in
            
            if (error != nil) {
                print("Error getting results from query")
            }
            else {
                print("Got something!")
                print("Num items in database matching query: \(snapshot!.count)")
                
                // 1. Get one result from database
                let results = snapshot!.documents
                let data = results[0].data()
               // print(data["link"]!)
              
                
                //self.webView.load(req)
                
                
                var reservations:String = ""
                 // Loop through all the results
                 for document in snapshot!.documents {
                    var x = document.data()
                    print(x["name"]!)
                    reservations.append("\(x["name"]!) \n")
                    reservations.append("\(x["day"]!) \n")
                    reservations.append("\n")
                 }
                self.textField.text = reservations
            }
        }
    
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
