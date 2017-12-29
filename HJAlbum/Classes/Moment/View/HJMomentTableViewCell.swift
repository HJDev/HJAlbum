//
//  HJMomentTableViewCell.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/27.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class HJMomentTableViewCell: UITableViewCell {

	var iModel : HJMomentModel?
	public var model : HJMomentModel {
		set {
			self.iModel = newValue
			let locationStr = "\(arc4random())"
			self.locationLabel.text = locationStr
		}
		get {
			return self.model
		}
	}
	
	private lazy var imaskView : UIView = {
		let maskView = UIView.init()
		maskView.backgroundColor = HJRGBA(red: 0, green: 0, blue: 0, alpha: 0.3)
		maskView.layer.cornerRadius = 5
		maskView.clipsToBounds = true
		return maskView
	}()
	override internal lazy var imageView: UIImageView = {
		let imageView = UIImageView.init()
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 5;
		imageView.clipsToBounds = true
		imageView.kf.setImage(with: URL.init(string: "http://www.xiansuan.com/uploads/imges/160918/e2xiif5dzjt4124.jpg"))
		return imageView
	}()
	private lazy var mContentView : UIView = {
		let mContentView = UIView.init()
		return mContentView
	}()
	private lazy var dateLabel : UILabel = {
		let dateLabel = UILabel.init()
		dateLabel.font = UIFont.systemFont(ofSize: 22)
		dateLabel.textColor = UIColor.white
		dateLabel.textAlignment = .center
		dateLabel.text = "2017-12-27";
		return dateLabel
	}()
	private lazy var locationLabel : UILabel = {
		let locationLabel = UILabel.init()
		locationLabel.font = UIFont.systemFont(ofSize: 18)
		locationLabel.textColor = UIColor.white
		locationLabel.textAlignment = .center
		locationLabel.text = "上海市杨浦区"
		return locationLabel
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.selectionStyle = .none
		self.setupViews()
		self.setupConstraints()
		self.imageView.kf.setImage(with: URL.init(string: "http://www.xiansuan.com/uploads/imges/160918/e2xiif5dzjt4124.jpg"))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: view init
	func setupViews() {
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.imaskView)
		self.imaskView.addSubview(self.mContentView)
		self.mContentView.addSubview(self.dateLabel)
		self.mContentView.addSubview(self.locationLabel)
	}
	func setupConstraints() {
		let marginLeft = 10.0
		self.imageView.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(marginLeft)
			make.right.equalToSuperview().offset(-marginLeft)
			make.bottom.equalToSuperview()
		}
		self.imaskView.snp.makeConstraints { (make) in
			make.left.right.top.bottom.equalTo(self.imageView)
		}
		self.mContentView.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
			make.left.right.equalToSuperview()
		}
		self.dateLabel.snp.makeConstraints { (make) in
			make.left.right.top.equalToSuperview()
			make.height.equalTo(ceil(self.dateLabel.font.lineHeight))
		}
		self.locationLabel.snp.makeConstraints { (make) in
			make.top.equalTo(self.dateLabel.snp.bottom).offset(5)
			make.left.right.bottom.equalToSuperview()
			make.height.equalTo(ceil(self.locationLabel.font.lineHeight))
		}
	}
	
}
