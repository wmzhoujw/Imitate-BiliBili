//
//	BannerModel.swift
//
//	Create by 超 王 on 11/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class BannerModel : NSObject{

	var image : String!
	var remark : String!
	var title : String!
	var type : Int!
	var value : String!
	var weight : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init() {
        
    }
	init(fromDictionary dictionary: NSDictionary){
		image = dictionary["image"] as? String
		remark = dictionary["remark"] as? String
		title = dictionary["title"] as? String
		type = dictionary["type"] as? Int
		value = dictionary["value"] as? String
		weight = dictionary["weight"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if image != nil{
			dictionary["image"] = image
		}
		if remark != nil{
			dictionary["remark"] = remark
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if value != nil{
			dictionary["value"] = value
		}
		if weight != nil{
			dictionary["weight"] = weight
		}
		return dictionary
	}


}
