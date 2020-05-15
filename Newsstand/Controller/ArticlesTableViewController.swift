import Foundation
import UIKit

class ArticlesTableViewController: UITableViewController {
    
    var category : String! = "Business"
    private var stories: [NewsStory] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(category.capitalized) Articles"
        tableView.register(
                    ArticleTableViewCell.nib,
                    forCellReuseIdentifier: ArticleTableViewCell.identifier
        )
        fetchArticles()
    }
    
    func fetchArticles(){
        APIClient.shared.getNews(cat: category) { (result) in
            switch result{
            case let .success(stories):
                DispatchQueue.main.async {
                    self.stories = stories
                    var basicSection = NewsSection()
                    basicSection.numberOfItems = stories.count
                    basicSection.items = stories
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = stories[indexPath.row]
        let storiesDetailVC = ArticleDetailViewController()
        storiesDetailVC.myStory = selectedArticle
        navigationController?.pushViewController(storiesDetailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(stories)

        return stories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
        let article = stories[indexPath.row]
        cell.setContents(news: article)
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
}
