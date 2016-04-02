import Foundation

extension UIView {
    
    func showToast(text: String) {
        let toastView = ToastView.create(text)
        addSubview(toastView)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: toastView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: toastView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let centerY = NSLayoutConstraint(item: toastView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        addConstraint(centerX)
        addConstraint(centerY)
        addConstraint(height)
        toastView.alpha = 0
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            toastView.alpha = 1
            }) { (_) -> Void in
                toastView.removeFromSuperview()
        }
    }
    
    
}
