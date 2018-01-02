//
//  HJMomentViewController.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/27.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import UIKit
import Photos
import CoreLocation

class HJMomentViewController: UITableViewController {

	private lazy var dataList : PHFetchResult<PHAsset> = PHFetchResult<PHAsset>.init()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
		self.tableView.separatorStyle = .none
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(HJMomentTableViewCell.classForCoder(), forCellReuseIdentifier: HJClassName(clazz: HJMomentTableViewCell.classForCoder()))
		
		self.dataList = getAllPic()
		
    }
	
	deinit {
		HJLog(message: "deinit")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//MARK: - UITableViewDataSource
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataList.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : HJMomentTableViewCell = tableView.dequeueReusableCell(withIdentifier: HJClassName(clazz: HJMomentTableViewCell.classForCoder())) as! HJMomentTableViewCell
		
		let asset : PHAsset = self.dataList.object(at: indexPath.row)
		let imageManager = PHCachingImageManager.init()
		let model = HJMomentModel.init()
		model.date = asset.creationDate
//		model.title = asset.location
		imageManager.requestImage(for: asset, targetSize: CGSize.init(width: 500, height: 500), contentMode: PHImageContentMode.default, options: nil) { (image: UIImage?, info: [AnyHashable : Any]?) in
			model.image = image
		}
		cell.model = model
		return cell
		
	}
	//MARK: - UITableViewDelegate
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let height = HJWidth() * 3.0 / 5.0
		
		return height
	}

}
