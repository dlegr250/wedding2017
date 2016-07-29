class ApplicationMailer < ActionMailer::Base
  helper ApplicationHelper

  default from: "Dan and Jacqueline Wedding 2017 <app@wedding2017.herokuapp.com>"
  layout "mailer"
end
