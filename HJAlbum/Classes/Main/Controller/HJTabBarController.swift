//
//  HJTabBarController.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/27.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import UIKit

class HJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = UIColor.white
		
		self.setupChildViewController()
		
    }
	
	/**
	* 添加子控制器
	*/
	func setupChildViewController() {
		let momentVc = HJMomentViewController()
		momentVc.title = "瞬间"
		let memeryVc = HJMemeryViewController()
		memeryVc.title = "回忆"
		let classificationVc = HJClassificationViewController()
		classificationVc.title = "分类"
		self.addChildViewController(self.configItemViewController(vc: momentVc, title: "瞬间", image: HJImageSrc(name: "ic_photo_off_Normal", bundle: "TabBar"), selectedImage: HJImageSrc(name: "ic_photo_on_Normal", bundle: "TabBar")))
		self.addChildViewController(self.configItemViewController(vc: memeryVc, title: "回忆", image: HJImageSrc(name: "ic_memory_off_Normal", bundle: "TabBar"), selectedImage: HJImageSrc(name: "ic_memory_on_Normal", bundle: "TabBar")))
		self.addChildViewController(self.configItemViewController(vc: classificationVc, title: "分类", image: HJImageSrc(name: "ic_classify_off_Normal", bundle: "TabBar"), selectedImage: HJImageSrc(name: "ic_classify_on_Normal", bundle: "TabBar")))
	}
	// MARK: config item view controller
	func configItemViewController(vc : UIViewController, title : String, image : String, selectedImage : String) -> UIViewController {
		let nav = HJNavigationController.init(rootViewController: vc)
		
		nav.tabBarItem.setTitleTextAttributes([
			NSAttributedStringKey.foregroundColor : HJRGB(red: 167.0, green: 167.0, blue: 167.0),
			NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13)], for: UIControlState.normal)
		nav.tabBarItem.setTitleTextAttributes([
			NSAttributedStringKey.foregroundColor : UIColor.black,
			NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13)], for: UIControlState.selected)
		nav.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
		nav.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
		
		
		return nav
	}

}
