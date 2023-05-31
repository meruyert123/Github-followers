import UIKit

class FavouritesListVC: UIViewController {
    
    var tableView = UITableView()
    var favorites: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        congireVC()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func congireVC() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No favorites.\nAdd one on the follower screen", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something get wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
}

extension FavouritesListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
}
