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
    begin
      gibbon = Gibbon::Request.new
      reponse = gibbon.lists("df077485b1").members.create(body: {
        email_address: params["email"], 
        status: "subscribed", 
        merge_fields: {
          FNAME: params["full_name"],
          LNAME: params["full_name"],
          NUMB: params["phone"]
        }
      }).body
      @success = true if !reponse["id"].nil? && reponse["email_address"] == params["email"]
    rescue Gibbon::MailChimpError => e
      json_reponse = JSON.parse(e.raw_body)
      @success = false
      @error_msg = json_reponse["title"]
    end
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.js
    end
  end
end
