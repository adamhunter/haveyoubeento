class YelpResource < RestaurantResource

  parse :id,         -> { data[:id] }
  parse :name,       -> { data[:name] }
  parse :url,        -> { data[:url] }
  parse :phone,      -> { data[:phone] }
  parse :address,    -> { location[:address].join(' ') }
  parse :city,       -> { location[:city] }
  parse :state_abbr, -> { location[:code] }
  parse :zip,        -> { location[:postal_code] }
  parse :rating,     -> { BigDecimal.new data[:rating], 3 }
  parse :source,     -> { {name: 'Yelp', key: 'yelp'} }

  def self.request(search)
    Yelp.client.search(search[:location], term: search[:query], cll: [search[:latitude], search[:longitude]].join(',')).businesses.map { |b| b.instance_variable_get(:@hash) }
  end

  private

  def location
    data[:location]
  end

end
