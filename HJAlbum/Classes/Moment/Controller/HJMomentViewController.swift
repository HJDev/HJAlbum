//
//  HJMomentViewController.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/27.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import UIKit

class HJMomentViewController: UITableViewController {

	private lazy var dataList : Array<Any> = Array<Any>()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
		self.tableView.separatorStyle = .none
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(HJMomentTableViewCell.classForCoder(), forCellReuseIdentifier: HJClassName(clazz: HJMomentTableViewCell.classForCoder()))
		
		getAllPic()
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
//		return self.dataList.count
		return 10
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : HJMomentTableViewCell = tableView.dequeueReusableCell(withIdentifier: HJClassName(clazz: HJMomentTableViewCell.classForCoder())) as! HJMomentTableViewCell
		cell.model = HJMomentModel.init(dic: Dictionary.init())
		return cell
		
	}
	//MARK: - UITableViewDelegate
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let height = HJWidth() * 2.0 / 5.0
		
		return height
	}

}
