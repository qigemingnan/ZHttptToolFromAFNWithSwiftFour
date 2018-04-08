//
//  ZHttpTools.swift
//  Created by Bob on 2018/4/5.
//  Copyright © 2018年  All rights reserved.
//

import UIKit

import AFNetworking

//枚举
enum RequestType:String {
    case GET = "GET"
    case POST = "POST"
}


class ZHttpTools: AFHTTPSessionManager {

    static let shareInstance: ZHttpTools = {
        
        let tools = ZHttpTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")

        return tools
    }()
    
}


extension ZHttpTools {
    
        func request(methodTypea methodType : RequestType, urlString: String, parametersa: Any? , progress downloadProgress: ((Progress) -> Void)?, finished : ((_ result : Any?, _ error : Error?) ->Void)?) {

            let successa = { (task : URLSessionDataTask, resulta : Any) in
                finished!(resulta,nil)
            }
            
            let failurea =  { (task : URLSessionDataTask?, errora : Error) in
                finished!(nil, errora)
            }
            
            let progressa = { (progress:Progress) in
                
            }
            
            if methodType == .GET {
                
                get(urlString, parameters: parametersa, progress: progressa, success: successa, failure: failurea)
                
            }else {
                
                post(urlString, parameters: parametersa, progress: progressa, success: successa, failure:failurea)
                
            }
    }
}
