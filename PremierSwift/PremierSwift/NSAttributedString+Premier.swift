import UIKit

extension NSAttributedString {
    
    static var titleAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1), NSForegroundColorAttributeName: UIColor.darkGray]
    }
    
    static var bodyAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body), NSForegroundColorAttributeName: UIColor.gray]
    }
    
}

