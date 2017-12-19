//
//  AHAlertView.swift
//  AHAlert
//
//  Created by IvanGao on 2017/11/5.
//  Copyright © 2017年 Cuapp. All rights reserved.
//

class AHAlertView: NSObject {
    typealias ActionHandler = ((UIAlertAction) -> Void)
    private var alertController: UIAlertController
    public init(title: String?, message: String?, type: UIAlertControllerStyle = .alert) {
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: type)
    }
    
    public func setCancelAction(customTititle: String? = nil, handler: ActionHandler? = nil) -> Self {
        return addAction(UIAlertAction(title: customTititle ?? "Cancel", style: .cancel, handler: handler))
    }
    
    public func setAction(customTititle: String? = nil, handler: ActionHandler? = nil) -> Self {
        return addAction(UIAlertAction(title: customTititle ?? "OK", style: .default, handler: handler))
    }
    
    public func addAction(_ action: UIAlertAction) -> Self {
        self.alertController.addAction(action)
        return self
    }
    
    public func addActions(_ actions: [UIAlertAction]) -> Self {
        actions.forEach {
            self.alertController.addAction($0)
        }
        return self
    }
    
    public func startPresent(on viewController: UIViewController) {
        viewController.present(self.alertController, animated: true)
    }
}
