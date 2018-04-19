//
//  Target_GGPayKit.swift
//  GGPaykit
//
//  Created by Youhao Gong 宫酉昊 on 2018/4/18.
//  Copyright © 2018年 Youhao Gong 宫酉昊. All rights reserved.
//

import UIKit

class Target_GGPayKit: NSObject {
    func Action_refund(params:[String: Any]) -> UIViewController {
        if let block = params["callback"]{
            (block as! (String) -> Void)("success")
        }
        let bundle = Bundle(for: RefundController.self)
        let vc = RefundController(nibName: "RefundController", bundle: bundle)
        return vc
    }
    
    func Action_payment(params:NSDictionary) -> UIViewController {
        let bundle = Bundle(for: PaymentController.self)
        return PaymentController(nibName: "PaymentController", bundle: bundle)
    }
}
