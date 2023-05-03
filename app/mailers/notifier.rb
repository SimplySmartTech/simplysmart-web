class Notifier < ApplicationMailer
 
  def enquiry(params)
    @params = params
    mail(
      from: "info@simplysmart.tech",
      to: ["avdhoot@simplysmart.tech"], 
      subject: "New Enquiry: #{params[:subject]}"
    )
  end
end