addresses = {
  [56.878333, 14.809167] => {
    'latitude' => 56.878333,
    'longitude' => 14.809167,
    'address' => 'Västergatan 6, Växjö',
    'city' => 'Växjö',
    'state' => 'Kronoberg',
    'country' => 'Sweden',
    'country_code' => 'SE'
  }
}

Geocoder.configure(lookup: :test)
addresses.each do |lookup, results|
  Geocoder::Lookup::Test.add_stub(lookup, [results])
end
