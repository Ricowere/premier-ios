import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
        window = UIWindow(frame: UIScreen.main.bounds)
        let moviesViewController = UIStoryboard(name: "Movies", bundle: Bundle.main).instantiateViewController(MoviesViewController.self)
        let navigationController = UINavigationController(rootViewController: moviesViewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
		
        return true
    }
}

