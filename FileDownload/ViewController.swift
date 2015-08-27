//
//  ViewController.swift
//  FileDownload
//
//  Created by Kyle Goslan on 08/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var info: JSON!

    override func viewDidLoad() {
        super.viewDidLoad()
        println(dataFilePath())
        
        let apiURL = "http://clifftrip.com/api/climbs.php"

        downloadFileAtURL(apiURL, completion: { (success) -> Void in
            
        })
    }
    
    func downloadFileAtURL(url: String, completion: (success: Bool) -> Void) {
        Alamofire.request(.GET, url)
            .responseJSON { request, response, json, error in
            if error == nil {
                let json = JSON(json!)
                json.rawData()?.writeToFile(self.dataFilePath(), atomically: true)
                completion(success: true)
            } else {
                completion(success: false)
            }
        }
    }
    
    func loadFile() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                var x = NSData(contentsOfFile: dataFilePath())
                info = JSON(data: x!)
            }
        }
    }
    
    func fileOlderThanDate(date: NSDate) -> Bool {
        let fileAttributes = getFileAttributes()
        let modifiedDate = fileAttributes!["NSFileModificationDate"] as! NSDate
        return modifiedDate.isLessThanDate(date)
    }
    
    func getFileAttributes() -> NSDictionary? {
        return NSFileManager.defaultManager().attributesOfItemAtPath(dataFilePath(), error: nil)
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as! [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("dummy.json")
    }

}