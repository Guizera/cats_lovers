//
//  CatsViewController.swift
//  cats_lovers
//
//  Created by José Alves da Cunha on 28/03/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit
import Kingfisher

class CatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var catsCollectionView: UICollectionView!
    
    var data = [CatsItems]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.purple
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
        catsCollectionView.delegate = self
        catsCollectionView.dataSource = self
        
        getCatsRequest.getCats { (event, vector) in
            if let catsItens = vector {
                self.data = catsItens
                
            }
            
            self.catsCollectionView.reloadData()
        }
        
        

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catsCollectionView.dequeueReusableCell(withReuseIdentifier: "catsCell", for: indexPath) as! CatsCollectionViewCell
        let cat = data[indexPath.row]
        cell.catsImage.kf.indicatorType = .activity
        cell.catsImage.kf.setImage(with: URL(string: cat.image))
        print("teste\(cat.image)")
        
        return cell
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
