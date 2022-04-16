//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var heritageImage: UIImageView!
    @IBOutlet private weak var heritageDescription: UILabel!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextOfDetailView()
        self.title = item?.name
    }
}

// MARK: - logic method
extension DetailViewController {
    private func setTextOfDetailView() {
        guard let itemImageName = item?.imageName else {
            return
        }
        
        heritageImage.image = UIImage(named: itemImageName)
        heritageDescription.text = item?.description
    }
}
