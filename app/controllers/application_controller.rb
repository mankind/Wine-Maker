class ApplicationController < ActionController::Base
  protect_from_forgery

  #Allows creating an object using respond_with to work with rabl gem
  #Added here to aviod adding it to individual controllers
  #See /config/initializers/my_responder.rb
  self.responder = MyResponder
end
