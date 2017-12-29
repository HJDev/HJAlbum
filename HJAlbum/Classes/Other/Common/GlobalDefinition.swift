//
//  GlobalDefinition.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/27.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import Foundation
import UIKit

func HJLog<T>(message: T,
			  logError: Bool = false,
			  file: String = #file,
			  method: String = #function,
			  line: Int = #line) {
	if logError {
		print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
	} else {
		#if DEBUG
			print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
		#endif
	}
}

func HJRGBA(red r: CGFloat, green g: CGFloat, blue b:CGFloat, alpha a:CGFloat) -> UIColor {
	return UIColor.init(red: (r / 255.0), green: (g / 255.0), blue: (b / 255.0), alpha: (a))
}
func HJRGB(red r: CGFloat, green g: CGFloat, blue b:CGFloat) -> UIColor {
	return HJRGBA(red: (r), green: (g), blue: (b), alpha: 1.0)
}
/** 获取图片地址 */
func HJImageSrc(name: String, bundle: String) -> String {
	var bundleName = bundle + ".bundle/"
	bundleName.append(name)
	return bundleName
}
/** 获取一个类的类名 */
func HJClassName(clazz: AnyClass) -> String {
	return String.init(describing: clazz)
}
/** 屏幕宽度 */
func HJWidth() -> CGFloat {
	return UIScreen.main.bounds.size.width
}
/** 屏幕高度 */
func HJHeight() -> CGFloat {
	return UIScreen.main.bounds.size.height
}
