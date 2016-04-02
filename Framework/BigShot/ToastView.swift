import Foundation

class ToastView: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    class func create(text: String) -> ToastView {
        let toastView = loadFromNib(ToastView)
        toastView!.label.text = text
        return toastView!
    }
    
}

extension UIView {
    
    class func loadFromNib<T: UIView>(view: T.Type) -> T? {
        if let nib = NSBundle(identifier: "com.tt.BigShot")!.loadNibNamed(className(), owner: nil, options: nil) {
            for object in nib {
                if let object = object as? T {
                    return object
                }
            }
        }
        return nil
    }
}

extension NSObject {
    
    class func className() -> String {
        let objectClass: AnyClass = self
        let objectClassName = NSStringFromClass(objectClass)
        let objectClassNameComponents = objectClassName.componentsSeparatedByString(".")
        return objectClassNameComponents.last!
    }
}

