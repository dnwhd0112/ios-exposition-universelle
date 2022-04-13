//
//  ViewController2.swift
//  Expo1900
//
//  Created by 곽우종 on 2022/04/13.
//

import UIKit

class ViewController2: UITableViewController {
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = loadInfo() ?? []
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)

            
            return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
