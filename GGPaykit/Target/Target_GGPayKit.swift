//
//  Target_GGPayKit.swift
//  GGPaykit
//
//  Created by Youhao Gong 宫酉昊 on 2018/4/18.
//  Copyright © 2018年 Youhao Gong 宫酉昊. All rights reserved.
//

import UIKit

@objc(Target_GGPayKit)
class Target_GGPayKit: NSObject {
    @objc
    func Action_refund(params:NSDictionary) -> UIViewController {
        
        if let block = params["callback"] {
            typealias CallbackType = @convention(block) (NSString) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())//获取内存地址
            let callback = unsafeBitCast(blockPtr, to: CallbackType.self)//指针转换
            callback("refund")
        }
        
        let bundle = Bundle(for: RefundController.self)
        let vc = RefundController(nibName: "RefundController", bundle: bundle)
        return vc
    }
    
    @objc
    func Action_payment(params:NSDictionary) -> UIViewController {
        let bundle = Bundle(for: PaymentController.self)
        return PaymentController(nibName: "PaymentController", bundle: bundle)
    }
}
