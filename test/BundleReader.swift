//
//  BundleReader.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//
import Foundation

// This class is going to help me retrieving the strings from the plist file. For a bigger project, I will put all this strings in a separate plist instead of the Info plist. Constants like the base URL and API keys are important to keep them in a plist, for example, it would be helpful when having multiple environments
class BundleReader: NSObject {
    
    private let baseUrl = "BaseURL"
    
    func getStringForKey( key: String) -> String {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile:path)
        let value = plist?.object(forKey: key) as! String
        return value
    }
    
    func valueForBaseURL() -> String {
        return getStringForKey(key: baseUrl)
    }
}
