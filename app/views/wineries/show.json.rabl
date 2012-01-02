object @winery

attributes :name, :city, :state, :country

child :wines do
  attributes :name, :year, :family
end
