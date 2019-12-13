class HomeController < ApplicationController
  def index
    static_banners = Banner::STATIC
    static_banners_obj = Banner.where("permalink in (?)", static_banners)
    static_banners_obj.each do |banner|
      instance_variable_set("@#{banner.permalink.gsub('-', '_')}", banner)
    end
    @banners = Banner.where("permalink not in (?) or permalink is null", static_banners)
  end

  def about_us
  end

  def subscribe
  end
end
