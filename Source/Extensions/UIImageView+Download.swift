//
//  Created by Pierluigi Cifani on 28/04/16.
//  Copyright © 2016 Blurred Software SL. All rights reserved.
//

import PINRemoteImage
import BSWFoundation

public typealias BSWImageDownloaderProgressBlock = (Int, Int) -> Void
public typealias BSWImageCompletionBlock = (Result<UIImage>) -> Void

extension UIImageView {

    public func bsw_setImageFromURLString(url: String) {
        if let url = NSURL(string: url) {
            pin_setImageFromURL(url)
        }
    }

    public func bsw_cancelImageLoadFromURL() {
        pin_cancelImageDownload()
    }
    
    public func bsw_setImageWithURL(url: NSURL, completed completedBlock: BSWImageCompletionBlock? = nil) {
        
        pin_setImageFromURL(url) { (downloadResult) in

            let result: Result<UIImage>
            if let image = downloadResult.image {
                result = Result(value: image)
            } else if let error = downloadResult.error {
                result = Result(error: error)
            } else {
                result = Result(error: NSError(domain: "com.bswinterfacekit.uiimageview", code: 0, userInfo: nil))
            }
            
            completedBlock?(result)
        }
    }
    
    public func bsw_setPhoto(photo: Photo) {
        switch photo.kind {
        case .Image(let image):
            self.image = image
        case .URL(let url):
            backgroundColor = photo.averageColor
            bsw_setImageWithURL(url) { result in
                guard result.error == nil else { return }
                self.image = result.value
                self.backgroundColor = nil
            }
        }
    }
}

