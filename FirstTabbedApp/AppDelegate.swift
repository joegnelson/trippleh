//
//  AppDelegate.swift
//  FirstTabbedApp
//
//  Created by Nelson, Joe on 7/4/17.
//  Copyright © 2017 Nelson, Joe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func completionX(){
        
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.getRecipes(completion: completionX)
        return true
    }
    static func getRecipes (completion: @escaping ( ) -> Void){
        //CREATE REQUUEST
        let request2 = URLRequest(url: URL(string: "\(baseDomain)/recipe")!)
        
        //CREATE TASK
        let task = URLSession.shared.dataTask(with: request2) { data, response, error in guard (data != nil), error == nil else {
            loadDatabaseFromLocalStorage()
            print("ERROR = \(String(describing: error))")
            return
            }
            _ = AppDelegate.processRecipeResponse(data: data, response: response)
            
//            //???
//            DispatchQueue.main.async {
//                if(responseString == nil){
//                    print("GET RECIPES FAILED!!!!!")
//                } else{
//                    print(responseString ?? "Logical Error!!!")
//                }
//            }
            completion()
        }
        //EXECUTE TASK
        task.resume()
    }
    static func loadDatabaseFromLocalStorage(){
        let ds2 = UserDefaults.standard.object(forKey:  "jsonDatabase") as! String
        let lsData = Data(ds2.utf8)
        do {
            database = try JSONDecoder().decode(cellDataList.self, from: lsData).recipes
        } catch {
            //handle error
            print(error)
        }
        SettingsViewController.recalculateDBStatic()

    }
    //----------------------------------------------------------
    // HELPER FUNCTIONS
    //----------------------------------------------------------
    static func processRecipeResponse(data: Data?, response: URLResponse?)-> String?{
        //var loginSuccess = false;
        //Check response code from login request AND set login success flag accordingly
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            loadDatabaseFromLocalStorage()
            
            print(response ?? "response is nil")
           return nil
        }
        
        //Get response
        let jsonDatabase = String(data: data!, encoding: .utf8)
        UserDefaults.standard.set(jsonDatabase, forKey: "jsonDatabase")

        
        //let responseString = String(data: data!, encoding: .utf8)
        //let jsonData=responseString?.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            database = try decoder.decode(cellDataList.self, from: data!).recipes
            SettingsViewController.recalculateDBStatic()
            //print("email:\(user?.email ?? "")") // Prints "Durian"
            //print("Refresh??? : \(database.count)")
        } catch {
            //handle error
            print(error)
        }
        return jsonDatabase!
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

