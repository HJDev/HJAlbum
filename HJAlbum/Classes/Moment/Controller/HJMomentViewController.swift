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

	private var dataList: Array<Array<HJMomentModel>> = Array<Array<HJMomentModel>>.init()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
		self.tableView.separatorStyle = .none
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(HJMomentTableViewCell.classForCoder(), forCellReuseIdentifier: HJClassName(clazz: HJMomentTableViewCell.classForCoder()))
		
		let queue: DispatchQueue = DispatchQueue.init(label: "manageOriginalData")
		queue.async {
			self.dataList = self.manageOriginalData(fetchResult: getAllPic())
			let mainQueue: DispatchQueue = DispatchQueue.main
			mainQueue.async {
				self.tableView.reloadData()
			}
		}
		
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
		
		let array:Array<HJMomentModel> = self.dataList[indexPath.row]
		let imageManager = PHCachingImageManager.init()
		let model = HJMomentModel.init()
		model.date = array.first?.date
		model.title = array.first?.title
		if array.first?.asset != nil {
			imageManager.requestImage(for: (array.first?.asset)!, targetSize: CGSize.init(width: 500, height: 500), contentMode: PHImageContentMode.default, options: nil) { (image: UIImage?, info: [AnyHashable : Any]?) in
				model.image = image
			}
		}
		cell.model = model
		return cell
		
	}
	//MARK: - UITableViewDelegate
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let height = HJWidth() * 3.0 / 5.0
		
		return height
	}
	
	//MARK: - manage original data
	func manageOriginalData(fetchResult: PHFetchResult<PHAsset>) -> Array<Array<HJMomentModel>> {
		var dataList: Array<Array<HJMomentModel>> = Array<Array<HJMomentModel>>.init()
		var dataArray: Array<HJMomentModel>? = Array<HJMomentModel>.init()
		var lastDateStr: String?
		fetchResult.enumerateObjects { (asset: PHAsset, index: Int, ump: UnsafeMutablePointer<ObjCBool>) in
			let dateFormatter: DateFormatter = DateFormatter.init()
			dateFormatter.dateFormat = "yyyy-MM-dd"
			let dateStr: String = dateFormatter.string(from: asset.creationDate!)
			
			let model: HJMomentModel = HJMomentModel.init()
			model.date = asset.creationDate
			model.dateStr = dateStr
			model.asset = asset
			model.title = nil
			if lastDateStr == dateStr || lastDateStr == nil {
				dataArray?.append(model)
				lastDateStr = dateStr
			} else {
				dataList.append(dataArray!)
				dataArray = Array<HJMomentModel>.init()
				dataArray?.append(model)
				lastDateStr = nil
			}
			if index == fetchResult.count - 1 {
				dataList.append(dataArray!)
				dataArray = nil
				lastDateStr = nil
			}
		}
		return dataList
		
	}

}
