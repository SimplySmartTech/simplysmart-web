class Notifier < ApplicationMailer
 
  def enquiry(params)
    @params = params
    mail(
      to: ["avadhoot@simplysmart.tech", "vishwajeet@simplysmart.tech"], 
      subject: "New Enquiry: #{params[:subject]}"
    )
  end
end