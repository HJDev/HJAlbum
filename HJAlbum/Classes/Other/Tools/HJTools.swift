//
//  HJTools.swift
//  HJAlbum
//
//  Created by HeJun on 2017/12/28.
//  Copyright © 2017年 HeJun. All rights reserved.
//

import Foundation
import Photos

/** 获取所有图片 */
func getAllPic() {
	//获得自定义相册
	let results : PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.albumRegular, options: PHFetchOptions?.none)
	
	
//	for assetCollection in results {
//		//遍历相册
//		enumerateAssetInAssetCollection(assetCollection: assetCollection, original: false)
//	}
//	let assetCollection = results.firstObject as! PHAssetCollection
//	HJLog(message: assetCollection.localizedTitle)
	
	//获得相机胶卷
	let assetAlbum = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.smartAlbum, subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary, options: nil).lastObject
	//遍历相机胶卷
	
	
}
private func enumerateAssetInAssetCollection(assetCollection : PHAssetCollection, original : Bool) {
	HJLog(message: assetCollection.localizedTitle)
}
