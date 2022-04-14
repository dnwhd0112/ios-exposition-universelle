//
//  ViewController3.swift
//  Expo1900
//
//  Created by marisol on 2022/04/14.
//

import UIKit

protocol ItemDelegate: NSObject {
    func sendItem(item: Item)
}

class ViewController3: UIViewController, ItemDelegate {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let usingItem = item else {
            return
        }
        itemImage.image = UIImage(named: usingItem.imageName)
        descriptionLabel.text = usingItem.description
        
        // Do any additional setup after loading the view.
    }
    
    func sendItem(item: Item) {
        itemImage.image = UIImage(named: item.imageName)
        descriptionLabel.text = item.description
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
