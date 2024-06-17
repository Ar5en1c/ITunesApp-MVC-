//
//  MainArtistViewController.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit

//MARK: Main view controller class which shows the artists name in a table view
class MainArtistViewController: UIViewController {

    @IBOutlet weak var mainArtistTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var artistInfoList: [ArtistInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainArtistTableView.dataSource = self
        fetchArtistData()
    }
    
}

//MARK: TableView Functions
extension MainArtistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainArtistTableView.dequeueReusableCell(withIdentifier: "ITuneArtistNameCell", for: indexPath) as? ITuneArtistNameCell {
            cell.dataRecieved = artistInfoList[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

//MARK: FetchData Function
extension MainArtistViewController {
    func fetchArtistData() {
        self.activityIndicator.startAnimating()
        ApiClass.shared.fetchData(url: Constants.iTunesAPIURL.rawValue) { [weak self] (searchResult: SearchResult?) in
            guard let self = self else { return }
            guard let searchResult = searchResult else {
                print("Failed to fetch or extract data")
                return
            }
            self.artistInfoList = searchResult.results
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.mainArtistTableView.reloadData()
            }
        }
    }
}
