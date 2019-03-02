import UIKit

class ViewController: UIViewController {

    
    
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cView.backgroundColor = UIColor.red
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.delegate = self
        cView.dataSource = self
        cView.isPagingEnabled = true
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal
        return cView
        
    }()
    
    var pages: [Page] = {
        var pages = [Page]()
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "image_cvLogin")
        pages.append(firstPage)
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "image2_cvLogin")
        pages.append(secondPage)

        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "image3_cvLogin")
        pages.append(thirdPage)
        
        return pages
    }()
    
    //let cell : UICollectionViewCell
    let cellId = "cellId"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addingConstraints()
        
    }

    func setupViews(){
        view.addSubview(cv)
        cv.register(loginCollectionCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func addingConstraints(){
        //cvConstraints
        cv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cv.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cv.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! loginCollectionCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
