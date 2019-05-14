//
//  DetailViewController.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/23/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Article? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

