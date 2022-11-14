//
//  Extension.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import UIKit
struct ProgressDialog {
    static var alert = UIAlertController()
    static var progressView = UIProgressView()
    static var progressPoint : Float = 0{
        didSet{
            if(progressPoint == 1){
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension UIViewController {
    
    func showMessage(_ message: String) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertController.view.tintColor = .gray
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
        alertController.view.tintColor = .gray
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertController.view.tintColor = .gray
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ title: String, _ message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
        alertController.view.tintColor = .gray
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ title: String, _ message: String, _ doneTitle: String, _ cancelTitle: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: doneTitle, style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showNoConnection(completion: @escaping (Bool) -> ()) {
        let alertVC = UIAlertController(title: "Oops, something went wrong. Please try again.", message: "The Internet connection appears to be offline.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            completion(false)
        }))
        alertVC.addAction(UIAlertAction(title: "Try again", style: .default, handler: { (alertAction) in
            completion(true)
        }))
        alertVC.view.tintColor = .gray
        self.present(alertVC, animated: true)
    }
    
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }
            
            switch view {
            case let scrollView as UIScrollView:
                if scrollView.scrollsToTop == true {
                    scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
                    
                    return
                }
            default:
                break
            }
            
            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }
        
        scrollToTop(view: view)
    }
    
    var isScrolledToTop: Bool {
        if self is UITableViewController {
            return (self as! UITableViewController).tableView.contentOffset.y == 0
        }
        for subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                return (scrollView.contentOffset.y == 0)
            }
        }
        return true
    }
    func setupFullScreenModal() {
        modalPresentationStyle = .fullScreen
    }
    
    static var activityIndicatorTag = 12345
    
    func startLoading() {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.tag = UIViewController.activityIndicatorTag
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    func stopLoading() {
        let activityIndicator = view.viewWithTag(UIViewController.activityIndicatorTag) as? UIActivityIndicatorView
        DispatchQueue.main.async {
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
        }
    }
}
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
