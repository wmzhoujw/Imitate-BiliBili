//
//	SerializingModel.swift
//
//	Create by 超 王 on 17/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SerializingModel : NSObject{
    
    var cover : String!
    var favourites : String!
    var isFinish : Int!
    var isStarted : Int!
    var lastTime : Int!
    var newestEpIndex : String!
    var pubTime : Int!
    var seasonId : Int!
    var seasonStatus : Int!
    var title : String!
    var watchingCount : Int!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        cover = json["cover"].stringValue
        favourites = json["favourites"].stringValue
        isFinish = json["is_finish"].intValue
        isStarted = json["is_started"].intValue
        lastTime = json["last_time"].intValue
        newestEpIndex = json["newest_ep_index"].stringValue
        pubTime = json["pub_time"].intValue
        seasonId = json["season_id"].intValue
        seasonStatus = json["season_status"].intValue
        title = json["title"].stringValue
        watchingCount = json["watching_count"].intValue
    }
    static func modelArray(KeysValues:[JSON]?)->[SerializingModel]?{
        if KeysValues == nil{
            return nil
        }
        var array = [SerializingModel]()
        for json in KeysValues!{
            array.append(SerializingModel.init(fromJson: json))
        }
        return array
    }
    
}
