//
//	RecommendModel.swift
//
//	Create by 超 王 on 14/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
// MARK: - 热门推荐model
class RecommendModel:NSObject{

	var cover : String!
	var desc1 : String!
	var gotoField : String!
	var height : Int!
	var param : String!
	var status : Int!
	var style : String!
	var title : String!
	var width : Int!

    override init() {
        
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cover = dictionary["cover"] as? String
		desc1 = dictionary["desc1"] as? String
		gotoField = dictionary["goto"] as? String
		height = dictionary["height"] as? Int
		param = dictionary["param"] as? String
		status = dictionary["status"] as? Int
		style = dictionary["style"] as? String
		title = dictionary["title"] as? String
		width = dictionary["width"] as? Int
	}

}
