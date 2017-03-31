//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The detail about a film
 */
class FilmDetailViewController : UIViewController {
    
    static let Episode = "Episode"
    static let LocalizationFile = "ViewTexts"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var viewModel: FilmDetailViewModel? 
    
    override func viewDidLoad() {
        if viewModel == nil {
            return
        }
        self.navigationItem.title = NSLocalizedString(FilmDetailViewController.Episode, tableName: FilmDetailViewController.LocalizationFile, comment: "") + " " + viewModel!.episodeID
        self.titleLabel.text = viewModel!.title
        self.directorLabel.text = viewModel!.director
        self.producerLabel.text = viewModel!.producer
        self.openingCrawlLabel.text = viewModel!.openingCrawl
        let backGesture = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        backGesture.direction = .right
        self.view.addGestureRecognizer(backGesture)
    }
    
    func goBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

import UIKit
