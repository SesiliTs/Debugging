//
//  NewsViewModel.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

protocol NewsViewModelDelegate: AnyObject {
    func newsFetched(_ news: [News])
    func showError(_ error: Error)
}

protocol NewsViewModel {
    var delegate: NewsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultNewsViewModel: NewsViewModel {
    
    // MARK: - Properties
    private let newsAPI = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-11&sortBy=publishedAt&apiKey=ce67ca95a69542b484f81bebf9ad36d5"
    //API იყო არასწორი და ესეც შევცვალე
    
    private var newsList = [News]()
    
    weak var delegate: NewsViewModelDelegate?
    // weak var არ იყო აქ და შევცვალე

    
    // MARK: - Public Methods
    func viewDidLoad() {
        fetchNews()
    }
    
    // MARK: - Private Methods
    private func fetchNews() {
        NetworkManager.shared.get(url: newsAPI) { [weak self] (result: Result<Article, Error>) in
            guard let self else { return }
            //selfს გავუკეთე ანვრეფი
            
            switch result {
            case .success(let article):
                self.newsList.append(contentsOf: article.articles)
                self.delegate?.newsFetched(self.newsList)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
}

