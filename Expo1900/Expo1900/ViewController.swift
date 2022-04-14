//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewTransitionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expositionInfo = loadInfo() else {
            return
        }
        setInitValue(expositionInfo: expositionInfo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        titleLabel.text = expositionInfo.title
        visitorsLabel.text = "방문객 : \(expositionInfo.visitors) 명"
        locationLabel.text = "개최지: \(expositionInfo.location)"
        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
        descriptionLabel.text = expositionInfo.description
        viewTransitionButton.titleLabel?.text = "한국의 출품작 보러가기"
    }
    
    @IBAction func viewTransitionButtonIsTapped(_ sender: UIButton) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? ViewController2 else {
            return
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
