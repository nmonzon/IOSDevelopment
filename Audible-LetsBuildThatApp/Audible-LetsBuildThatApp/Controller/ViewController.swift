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
    
    var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor(white: 0.2, alpha: 1.0)
        pc.numberOfPages = 3
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor.orange
        return pc
    }()
    
    let btnSkip : UIButton = {
        let btnSkip = UIButton()
        btnSkip.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        btnSkip.setTitle("Skip", for: UIControl.State.normal)
        btnSkip.translatesAutoresizingMaskIntoConstraints = false
        return btnSkip
    }()
    
    let btnNext : UIButton = {
        let btnNext = UIButton()
        btnNext.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        btnNext.setTitle("Next", for: UIControl.State.normal)
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        return btnNext
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
        view.addSubview(pageControl)
        view.addSubview(btnSkip)
        view.addSubview(btnNext)
    }
    
    func addingConstraints(){
        //cvConstraints
        cv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cv.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cv.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        btnSkip.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        btnSkip.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        btnSkip.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        btnNext.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        btnNext.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        btnNext.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btnNext.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
