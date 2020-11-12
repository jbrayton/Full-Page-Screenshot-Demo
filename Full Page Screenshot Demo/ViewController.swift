//
//  ViewController.swift
//  Full Page Screenshot Demo
//
//  Created by John Brayton on 11/12/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground

        self.webView = WKWebView()
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.clipsToBounds = true
        self.view.addSubview(self.webView)
        
        self.view.addConstraint(self.webView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor))
        self.view.addConstraint(self.webView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor))
        self.view.addConstraint(self.webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
        self.view.addConstraint(self.webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
        
        self.webView.load(URLRequest(url: URL(string: "https://www.meetup.com/cocoaheads-boston/")!))

    }

}

