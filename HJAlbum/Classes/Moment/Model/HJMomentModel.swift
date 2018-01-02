//
//  HJMomentModel.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/28.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import UIKit

class HJMomentModel: NSObject {
	/** 图片地址 */
	var imageUrl : String?
	/** 图片 */
	var image : UIImage?
	/** 标题 */
	var title : String?
	/** 日期 */
	var date : Date?
	
	override init() {
		
	}
	init(dic : [String : AnyObject]) {
		super.init()
		setValuesForKeys(dic)
	}
	override func setValue(_ value: Any?, forKey key: String) {
		let msg = key + ":" + "\(String(describing: value))"
		HJLog(message: msg)
	}
}
