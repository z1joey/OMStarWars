//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * A film cell in the film list.
 */
class FilmListCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: FilmListCellViewModel? {
        didSet{
            if viewModel == nil {
                return
            }
            titleLabel.text = viewModel!.title
        }
    }
    
}

import UIKit
