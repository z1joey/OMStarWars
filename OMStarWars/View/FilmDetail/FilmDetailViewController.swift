//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The detail about a film
 */
class FilmDetailViewController : UIViewController {
    
    static let Episode = "Episode"
    static let BackTitle = "Films"
    static let LocalizationFile = "ViewTexts"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var viewModel: FilmDetailViewModel? 
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem?.title = NSLocalizedString(FilmDetailViewController.BackTitle, tableName: FilmDetailViewController.LocalizationFile, comment: "")
        if viewModel == nil {
            return
        }
        self.navigationItem.title = NSLocalizedString(FilmDetailViewController.Episode, tableName: FilmDetailViewController.LocalizationFile, comment: "") + " " + viewModel!.episodeID
        self.titleLabel.text = viewModel!.title
        self.directorLabel.text = viewModel!.director
        self.producerLabel.text = viewModel!.producer
        self.releaseDateLabel.text = viewModel!.releaseDate
        self.openingCrawlLabel.text = viewModel!.openingCrawl
    }
    
}

import UIKit
