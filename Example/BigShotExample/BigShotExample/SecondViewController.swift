import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSURLRequest(URL: NSURL(string: "http://9gag.com")!)
        webView.loadRequest(request)
    }
}

