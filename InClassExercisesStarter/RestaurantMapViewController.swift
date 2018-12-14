//
//  RestaurantMapViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit
import Firebase

class RestaurantMapViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URL = "https://opentable.herokuapp.com/api/restaurants?city=Toronto&per_page=5"
        
        // ALAMOFIRE function: get the data from the website
        Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
            (response) in
            
            // -- put your code below this line
            
            if (response.result.isSuccess) {
                print("awesome, i got a response from the website!")
                print("Response from webiste: " )
                print(response.data)
                
                do {
                    let json = try JSON(data:response.data!)
                    
                    //print(json)
                    
                    // PARSING: grab the latitude and longitude
                    print(json["latitude"])
                    print(json["longitude"])
                    
                    
                    //let currently = json["currently"]["temperature"]
                    let temp = json["restaurants"]["city"]
                    
                    print("Tempearture: \(temp)")
                    
                }
                catch {
                    print ("Error while parsing JSON response")
                }
                
            }
        }
        print("loaded the map screen")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: Actions

    @IBAction func zoomInPressed(_ sender: Any) {
        
        print("zoom in!")
        
        // HINT: Check MapExamples/ViewController.swift
    }
    
    @IBAction func zoomOutPressed(_ sender: Any) {
        // zoom out
        print("zoom out!")
        
        // HINT: Check MapExamples/ViewController.swift
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
