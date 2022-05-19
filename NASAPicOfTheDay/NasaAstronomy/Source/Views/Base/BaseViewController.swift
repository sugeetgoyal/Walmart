//
//  BaseViewController.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import UIKit

class BaseViewController: UIViewController {    
    // MARK: - Action Methods
    @objc func didSelectDefaultAlertButton(with title: String?, and data: Any = []) -> Void {}
    
    @objc func didSelectCancelAlertButton(with title: String?, and data: Any = []) -> Void {}
    
    @objc func didSelectTeritaryAlertButton(with title: String?, and data: Any = []) -> Void {}
    
}

extension BaseViewController {
    func displayAlertViewController(title: String?,
                                    message: String,
                                    defaultTitle: String?,
                                    canceltTitle: String,
                                    tertiaryTitle: String? = nil) {
        let anAlertController = UIAlertController(title:title, message:message, preferredStyle: .alert)
        weak var weakSelf = self
        
        if defaultTitle != nil {
            let aDefaultAction = UIAlertAction(title:defaultTitle, style: UIAlertAction.Style.default) {
                UIAlertAction in
                weakSelf?.didSelectDefaultAlertButton(with: title)
            }
            
            anAlertController.addAction(aDefaultAction)
        }
        
        let aCancelAction = UIAlertAction(title:canceltTitle, style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            weakSelf?.didSelectCancelAlertButton(with: title)
        }
        
        anAlertController.addAction(aCancelAction)
        
        if tertiaryTitle != nil {
            let aTertiaryAction = UIAlertAction(title:tertiaryTitle, style: UIAlertAction.Style.default) {
                UIAlertAction in
                weakSelf?.didSelectTeritaryAlertButton(with: title)
            }
            
            anAlertController.addAction(aTertiaryAction)
        }
        
        anAlertController.modalPresentationStyle = .fullScreen
        self.present(anAlertController, animated: true, completion: nil)
    }
}
