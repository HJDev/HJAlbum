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
func getAllPic() -> PHFetchResult<PHAsset> {
	//获得自定义相册
	let results : PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.albumRegular, options: PHFetchOptions?.none)
	results.enumerateObjects { (obj : Any, index :Int, ump : UnsafeMutablePointer) in
		HJLog(message: obj)
	}
	
	let fetchOption = PHFetchOptions()
	fetchOption.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: false)]
	fetchOption.predicate = NSPredicate.init(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
	
	let fetchResults : PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOption)
	let imageManager = PHCachingImageManager.init()
	var images : PHFetchResult<PHAsset>?
	
	fetchResults.enumerateObjects { (asset : PHAsset, index : Int, ump : UnsafeMutablePointer<ObjCBool>) in
		imageManager.requestImage(for: asset, targetSize: CGSize.init(width: 50, height: 50), contentMode: PHImageContentMode.aspectFill, options: nil, resultHandler: { (image:UIImage?, info:[AnyHashable : Any]?) in
			HJLog(message: info)
		})
	}
	
	return fetchResults
	
//	for assetCollection in results {
//		//遍历相册
//		enumerateAssetInAssetCollection(assetCollection: assetCollection, original: false)
//	}
//	let assetCollection = results.firstObject as! PHAssetCollection
//	HJLog(message: assetCollection.localizedTitle)
	
	//获得相机胶卷
	let assetAlbum = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.smartAlbum, subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary, options: nil)
	//遍历相机胶卷
	HJLog(message: assetAlbum)
}
private func enumerateAssetInAssetCollection(assetCollection : PHAssetCollection, original : Bool) {
	HJLog(message: assetCollection.localizedTitle)
}
