//
//  TableViewController.swift
//  Expo1900
//
//  Created by marisol on 2022/04/14.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expositionInfo = loadInfo() else {
            return
        }
        
        setInitValue(expositionInfo: expositionInfo)
        tableView.dataSource = self
    }
    
    func loadInfo() -> ExpositionInfo? {
        let jsonManager = JsonManager()
        do {
            let expositionInfo = try jsonManager.decodedExpositionInfo()
            return expositionInfo
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func setInitValue(expositionInfo: ExpositionInfo) {
//        titleLabel.text = expositionInfo.title
//        visitorsLabel.text = "방문객 : \(expositionInfo.visitors) 명"
//        locationLabel.text = "개최지: \(expositionInfo.location)"
//        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
//        descriptionLabel.text = expositionInfo.description
//        viewTransitionButton.titleLabel?.text = "한국의 출품작 보러가기"
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let expositionInfo = loadInfo() else {
            return
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        cell.textLabel?.text = expositionInfo.title
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        cell.textLabel?.text = expositionInfo.title

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
