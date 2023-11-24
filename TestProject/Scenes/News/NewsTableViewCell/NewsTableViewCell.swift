//
//  NewsTableViewCell.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import UIKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {
    //აქ UITableViewCell უნდა ყოფილიყო CollectionViewCell-ის მაგივრად
    
    // MARK: - UI Elements
    private var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        // ზემოთ ესეც ზედმეტი იყო და ქვედა ფროფერთებშიც, ბოლო სთექვიუს გარდა არსად არ იყო საჭირო
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 117).isActive = true
        return imageView
    }()
    
    private var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
//        label.isHidden = true - მგონი არ გვინდოდა hidden :D
        return label
    }()
    
    private var newsAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newsTitleLabel, newsAuthorLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newsImageView, textStackView])
//        stackView.axis = .horizontal ჰორიზონტალურია დიფოლტად
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupSubviews() {
        contentView.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
            //rightAnchor leftAnchor topAnchor ქონსთრეინთები შევცვალე leading, trailing, bottomAnchor-ით
        ])
    }
    
    // MARK: - Configure
    func configure(with news: News) {
        let url = URL(string: news.urlToImage ?? "")
        newsImageView.kf.setImage(with: url)
        newsTitleLabel.text = news.title
        newsAuthorLabel.text = news.author
    }
}
