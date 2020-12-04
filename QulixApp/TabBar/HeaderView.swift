
import UIKit

class HeaderView: UIView {
    static func instantiate() -> HeaderView{
        let view: HeaderView = initFromnib()
        return view
    }

}
extension UIView {
    
    class func initFromnib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
}
