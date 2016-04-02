import Foundation

extension UIWindow {

    override public func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        if (event!.type == .Motion && event!.subtype == .MotionShake) {
            let image = takeBigShot()
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            showToast("BigShot saved to photos album.")
        }
    }
    
    public func takeBigShot() -> UIImage {
        let originalBounds = bounds
        let scrollViewAsView = getFirstInstance { (view) -> Bool in
            let foundView = view as? UIScrollView
            if let foundScrollView = foundView {
                return foundScrollView.contentSize.height > foundScrollView.bounds.height
            }
            return false
        }
        let webViewAsView = getFirstInstance({ $0 is UIWebView })
        var calculatedHeight : CGFloat = 0
        
        if let webView = webViewAsView as? UIWebView {
            let contentHeight = CGFloat(Float(webView.stringByEvaluatingJavaScriptFromString("document.height")!)!)
            let leftoverHeight = bounds.height - webView.bounds.height
            calculatedHeight = leftoverHeight + contentHeight
        } else if let scrollView = scrollViewAsView as? UIScrollView {
            let contentHeight = scrollView.contentSize.height
            let leftoverHeight = bounds.height - scrollView.bounds.height
            calculatedHeight = leftoverHeight + contentHeight
        }
        
        if calculatedHeight > bounds.height {
            bounds = CGRect(x: 0, y: 0, width: originalBounds.width, height: calculatedHeight)
        }
    
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        bounds = originalBounds
        return image
    }
}

extension UIView {
    func getFirstInstance(filter:(view: UIView) -> Bool) -> UIView? {
        if filter(view: self) {
            return self
        }
        
        for view in subviews {
            let subView = view.getFirstInstance(filter)
            if let subViewUnwrapped = subView {
                return subViewUnwrapped
            }
        }
        
        return nil
    }
}

