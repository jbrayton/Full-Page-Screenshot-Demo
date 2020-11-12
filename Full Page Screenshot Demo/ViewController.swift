//
//  ViewController.swift
//  Full Page Screenshot Demo
//
//  Created by John Brayton on 11/12/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webview: WKWebView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground

        self.webview = WKWebView()
        self.webview.translatesAutoresizingMaskIntoConstraints = false
        self.webview.clipsToBounds = true
        self.view.addSubview(self.webview)
        
        self.view.addConstraint(self.webview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor))
        self.view.addConstraint(self.webview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor))
        self.view.addConstraint(self.webview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
        self.view.addConstraint(self.webview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
        
        self.webview.load(URLRequest(url: URL(string: "https://www.meetup.com/cocoaheads-boston/")!))

    }

}

