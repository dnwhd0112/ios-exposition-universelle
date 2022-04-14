//
//  ViewController2.swift
//  Expo1900
//
//  Created by 곽우종 on 2022/04/13.
//

import UIKit

class ViewController2: UITableViewController {
    @IBOutlet var itemsTableView: UITableView!
    var items: [Item] = []
    weak var delegate: ItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = loadInfo() ?? []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = itemsTableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! ItemCell
        //! -> ? 로 나중에 변환
        
        let item = items[indexPath.row]
        
        cell.cellDescription.text = item.shortDescription
        cell.cellTitle.text = item.name
        cell.cellImageView.image = UIImage(named: item.imageName)
            
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3 else {
            return
        }
        
        //self.present(thirdViewController, animated: true, completion: nil)
        thirdViewController.item = items[indexPath.row]
        
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        
//        self.delegate = thirdViewController
  //      delegate?.sendItem(item: items[indexPath.row])
    }
    
    func loadInfo() -> [Item]? {
        let jsonManager: JsonManagerable = JsonManager()
        do {
            let item = try jsonManager.decodedItems()
            return item
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
