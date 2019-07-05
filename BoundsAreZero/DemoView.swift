import UIKit




/**
 This view demonstrates a problem, that a subview of a subview of the view does not have the expected bounds in
 layoutSubviews().
 
 The structure is:
 
     DemoView
         firstLevelSubview
             secondLevelSubview
 
 When layoutSubviews() is called, the view and the firstLevelSubview have the expected bounds, but the
 secondLevelSubview's bounds are 0. See the printed values in the console.
 
 Am I doing something wrong here?
 
 Is this expected behavior?
 
 - Note:
     The structure is an abstraction of a real case. To avoid the problem, secondLevelSubview could be added as a
     first level subview to DemoView. Though, this is something, that is not feasible in the real case.
 */
class DemoView: UIView {
    
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
    }

}






























