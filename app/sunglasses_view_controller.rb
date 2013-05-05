class SunglassesViewController < UIViewController
  def viewDidLoad
    super
    fetch_current_lumen
    self.view.backgroundColor = UIColor.whiteColor
    @image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview(@image_view)
    @label = UILabel.alloc.initWithFrame([[10, 10],[300, 30]])
    @label.backgroundColor = UIColor.clearColor
    @label.textColor = UIColor.blackColor
    @label.textAlignment = NSTextAlignmentCenter
    self.view.addSubview(@label)

    @button = UIButton.buttonWithType(UIButtonTypeCustom)
    @button.frame = [[10, UIScreen.mainScreen.bounds.size.height - 64], [28, 34]]
    @button.setBackgroundImage(UIImage.imageNamed("Reload"), forState:UIControlStateNormal)
    @button.addTarget(self, action:'reload_sunshine', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(@button)
  end

  def reload
    if (1..500).include?(@lumen)
      @label.text = "Nope, not this time!"
      @image_view.image = UIImage.imageNamed('Rainy')
    elsif (501..800).include?(@lumen)
      @label.text = "You should take your glasses with you."
      @image_view.image = UIImage.imageNamed('Cloudy')
    elsif @lumen > 800
      @label.text = "Yes!!!"
      @image_view.image = UIImage.imageNamed('Sunglasses')
    else
      @label.text = "Something went wrong"
    end
  end

  def fetch_current_lumen
    AFMotion::JSON.get("http://192.168.178.42/") do |result|
      if result.success?
        @lumen = result.object["values"]["light"]
        p @lumen
        reload
      end
    end
  end

  def reload_sunshine
    fetch_current_lumen
  end
end