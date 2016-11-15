//
//	LiveCell.swift
//
//	Create by 超 王 on 15/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class LiveModel:NSObject{

	var area : String!
	var areaId : Int!
	var cover : String!
	var gotoField : String!
	var height : Int!
	var online : Int!
	var param : String!
	var style : String!
	var title : String!
	var up : String!
	var upFace : String!
	var width : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    override init() {
        
    }
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		area = json["area"].stringValue
		areaId = json["area_id"].intValue
		cover = json["cover"].stringValue
		gotoField = json["goto"].stringValue
		height = json["height"].intValue
		online = json["online"].intValue
		param = json["param"].stringValue
		style = json["style"].stringValue
		title = json["title"].stringValue
		up = json["up"].stringValue
		upFace = json["up_face"].stringValue
		width = json["width"].intValue
	}

}
