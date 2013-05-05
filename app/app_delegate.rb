class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @sunglasses_vc = SunglassesViewController.alloc.init
    @window.rootViewController = @sunglasses_vc
    @window.makeKeyAndVisible
    true
  end
end
