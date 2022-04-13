//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var parisImageView: UIImageView!
    @IBOutlet var parisTitle: UILabel!
    @IBOutlet var parisVisitor: UILabel!
    @IBOutlet var parisLocation: UILabel!
    @IBOutlet var parisDuration: UILabel!
    @IBOutlet var parisDescription: UILabel!
    @IBOutlet var parisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expositionInfo = loadInfo() else {
            return
        }
        setInitValue(expositionInfo: expositionInfo)
        // Do any additional setup after loading the view.
    }
    
    func loadInfo() -> ExpositionInfo? {
        let jsonManager: JsonManagerable = JsonManager()
        do {
            let expositionInfo = try jsonManager.decodedExpositionInfo()
            return expositionInfo
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func setInitValue(expositionInfo: ExpositionInfo) {
        parisTitle.text = expositionInfo.title
        parisVisitor.text = "\(expositionInfo.visitors)"
        parisLocation.text = expositionInfo.location
        parisDuration.text = expositionInfo.duration
        parisDescription.text = expositionInfo.description
        
    }
}
