//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * A film cell in the film list.
 */
class FilmListCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeIDLabel: UILabel!
    
    var viewModel: FilmListCellViewModel? {
        didSet{
            if viewModel == nil {
                return
            }
            titleLabel.text = viewModel!.title
            episodeIDLabel.text = viewModel!.episodeID
        }
    }
    
}

import UIKit
