//
//  ViewController.swift
//  Moviefy
//
//  Created by Adriana González Martínez on 3/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        self.view.backgroundColor = UIColor.white
    }
    
    func setupCollectionView() {
    }
    
    func fetchArticles(){
        APIClient.shared.getNews { (result) in
            switch result{
            case let .success(stories):
                DispatchQueue.main.async {
                    self.stories = stories
                    var basicSection = NewsSection()
                    basicSection.numberOfItems = stories.count
                    basicSection.items = stories
                    self.sections.append(TitleSection(title: "News"))
                    self.sections.append(basicSection)
                    self.setupCollectionView()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case is NewsSection:
            let section = sections[indexPath.section] as! NewsSection
            return section.configureCell(collectionView: collectionView, indexPath: indexPath)
        default:
            return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        }
        
    }
}

extension ViewController: UICollectionViewDelegate {}
