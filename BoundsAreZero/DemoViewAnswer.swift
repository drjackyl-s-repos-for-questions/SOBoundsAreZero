import UIKit




/**
 vacawama answered the question here: https://stackoverflow.com/a/56901733/895108
 
 What was missing was to call layoutIfNeeded() after setting up the constraints of the subviews.
 */
class DemoViewAnswer: UIView {
    
    // MARK: - Initializers
    
    override public init(frame: CGRect) {
        firstLevelSubview = UIView()
        secondLevelSubview = UIView()
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        firstLevelSubview = UIView()
        secondLevelSubview = UIView()
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    
    
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        firstLevelSubview.layer.cornerRadius = bounds.width / 2
        secondLevelSubview.layer.cornerRadius = secondLevelSubview.bounds.width / 2
        
        print("bounds.width: \(bounds.width), contentView.bounds.width: \(firstLevelSubview.bounds.width), backgroundView.bounds.width: \(secondLevelSubview.bounds.width)")
    }
    
    
    
    
    
    // MARK: - Fileprivate
    
    fileprivate let firstLevelSubview: UIView
    fileprivate let secondLevelSubview: UIView
    
    fileprivate func setupViews() {
        backgroundColor = UIColor.clear
        
        firstLevelSubview.translatesAutoresizingMaskIntoConstraints = false
        firstLevelSubview.layer.masksToBounds = true
        firstLevelSubview.backgroundColor = UIColor.green
        addSubview(firstLevelSubview)
        firstLevelSubview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        firstLevelSubview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        firstLevelSubview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        firstLevelSubview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        secondLevelSubview.translatesAutoresizingMaskIntoConstraints = false
        secondLevelSubview.layer.masksToBounds = true
        secondLevelSubview.backgroundColor = UIColor.magenta
        firstLevelSubview.addSubview(secondLevelSubview)
        secondLevelSubview.widthAnchor.constraint(equalTo: firstLevelSubview.widthAnchor, multiplier: 0.84).isActive = true
        secondLevelSubview.heightAnchor.constraint(equalTo: firstLevelSubview.heightAnchor, multiplier: 0.84).isActive = true
        secondLevelSubview.centerXAnchor.constraint(equalTo: firstLevelSubview.centerXAnchor).isActive = true
        secondLevelSubview.centerYAnchor.constraint(equalTo: firstLevelSubview.centerYAnchor).isActive = true
        
        layoutIfNeeded()
    }
    
}






























