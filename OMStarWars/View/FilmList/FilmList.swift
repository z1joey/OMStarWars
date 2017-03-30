//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * A list of film.
 */
class FilmList : UITableView, UITableViewDataSource, UITableViewDelegate {
    
    static let FilmListCellID = "FilmListCell"
    
    var viewModel: FilmListViewModel
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = FilmListViewModel()
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmList.FilmListCellID) as! FilmListCell
        cell.viewModel = viewModel.getFilmListCellViewModel(atIndex: indexPath.row)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filmAmount
    }
}

import UIKit
