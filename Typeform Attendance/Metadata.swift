/* 
Copyright (c) 2016 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Metadata {
	public var browser : String?
	public var platform : String?
	public var date_land : String?
	public var date_submit : String?
	public var user_agent : String?
	public var referer : String?
	public var network_id : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let metadata_list = Metadata.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Metadata Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Metadata]
    {
        var models:[Metadata] = []
        for item in array
        {
            models.append(Metadata(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let metadata = Metadata(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Metadata Instance.
*/
	required public init?(dictionary: NSDictionary) {

		browser = dictionary["browser"] as? String
		platform = dictionary["platform"] as? String
		date_land = dictionary["date_land"] as? String
		date_submit = dictionary["date_submit"] as? String
		user_agent = dictionary["user_agent"] as? String
		referer = dictionary["referer"] as? String
		network_id = dictionary["network_id"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.browser, forKey: "browser")
		dictionary.setValue(self.platform, forKey: "platform")
		dictionary.setValue(self.date_land, forKey: "date_land")
		dictionary.setValue(self.date_submit, forKey: "date_submit")
		dictionary.setValue(self.user_agent, forKey: "user_agent")
		dictionary.setValue(self.referer, forKey: "referer")
		dictionary.setValue(self.network_id, forKey: "network_id")

		return dictionary
	}

}