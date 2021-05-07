//
//  ViewController.swift
//  Storm View
//
//  Created by Usertqi on 06/05/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - VARIABLES -
    var pictures = [String]()
    
    // MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchFile()
    }
}

// MARK: - FUNCS -
extension ViewController {
    func searchFile() {
        let fm = FileManager.default
        let patch = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: patch)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
}

// MARK: - DATA SOURCE -
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Detalhe") as? DetalilViewController else { return }
        vc.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

