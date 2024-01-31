//
//  ViewController.swift
//  CollectionView _Pagination
//
//  Created by Akash Belekar on 30/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collection:UICollectionView!
   
    var numbArray:[Int] = [1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.register(UINib(nibName: "CVC", bundle: nil), forCellWithReuseIdentifier: "CVC")
        collection.delegate = self
        collection.dataSource = self
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC", for: indexPath) as! CVC
        cell.lbl.text = "\(numbArray[indexPath.row])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == numbArray.count - 1 {
            moreData()
        }
    }
    
    func moreData(){
        for _ in 0 ... 9{
            numbArray.append(numbArray.last! + 1)
        }
        collection.reloadData()
    }
}
