//
//  ImageModel.swift
//  Krost
//
//  Created by Dmitry Muravev on 06.06.17.
//  Copyright © 2017 4Taps. All rights reserved.
//

//import RealmSwift
import ObjectMapper

class ImageModel: Mappable {

    //dynamic var id = 0
    var url = ""
    var urlTn = ""
    var title = ""

//    override class func primaryKey() -> String? {
//        return "id"
//    }
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        url <- map["url_tn"]
        urlTn <- map["url_tn"]
        title <- map["name"]
    }
}
