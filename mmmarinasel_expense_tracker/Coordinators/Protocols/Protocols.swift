import UIKit

protocol Coordinatable: class {
    
    func start()
}

protocol Presentable {
    
    var toPresent: UIViewController? { get }
}

//protocol Routable: Presentable {
//    
//    func present(_ module: Presentable?)
//    func present(_ module: Presentable?, animated: Bool)
//    
//    func push(_ module: Presentable?)
//    func push(_ module: Presentable?, animated: Bool)
//    func push(_ module: Presentable?, animated: Bool, completion: CompletionBlock?)
//    
//    func popModule()
//    func popModule(animated: Bool)
//    
//    func dismissModule()
//    func dismissModule(animated: Bool, completion: CompletionBlock?)
//    
//    func setRootModule(_ module: Presentable?)
//    func setRootModule(_ module: Presentable?, hideBar: Bool)
//    
//    func popToRootModule(animated: Bool)
//}
