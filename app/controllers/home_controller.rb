class HomeController < ApplicationController
  def index
  end

  def about_us
  end

  def solutions
  end

  def clients
  end

  def contact_us
  end

  def send_enquiry
    Notifier.enquiry(params).deliver_now!
    redirect_to contact_us_path
  end
end
