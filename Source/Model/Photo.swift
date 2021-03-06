//
//  Created by Pierluigi Cifani on 07/05/16.
//  Copyright © 2016 Blurred Software SL. All rights reserved.
//

import Foundation

public struct Photo {
    
    public enum Kind {
        case URL(NSURL)
        case Image(UIImage)
    }
    
    public let kind: Kind
    public let averageColor: UIColor
    public let size: CGSize?

    public init(kind: Kind, averageColor: UIColor = UIColor.randomColor(), size: CGSize? = nil) {
        self.kind = kind
        self.averageColor = averageColor
        self.size = size
    }

    public init(url: NSURL, averageColor: UIColor = UIColor.randomColor(), size: CGSize? = nil) {
        self.kind = .URL(url)
        self.averageColor = averageColor
        self.size = size
    }
    
    public static func emptyPhoto() -> Photo {
        return Photo(url: NSURL(), averageColor: UIColor.randomColor(), size: nil)
    }
}

extension Photo {
    static func samplePhotos() -> [Photo] {
        let photo1 = Photo(url: NSURL(string: "http://e2.365dm.com/15/09/768x432/alessandro-del-piero-juventus-serie-a_3351343.jpg?20150915122301")!)
        let photo2 = Photo(url: NSURL(string: "http://images1.fanpop.com/images/photos/2000000/Old-Golden-Days-alessandro-del-piero-2098417-600-705.jpg")!)
        let photo3 = Photo(url: NSURL(string: "http://e0.365dm.com/14/05/768x432/Alessandro-del-Piero-italy-2002_3144508.jpg?20140520095830")!)
        let photo4 = Photo(url: NSURL(string: "http://static.goal.com/576000/576031_heroa.jpg")!)
        return [photo1, photo2, photo3, photo4]
    }
}
