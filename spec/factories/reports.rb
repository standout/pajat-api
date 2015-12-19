FactoryGirl.define do
  factory :report do
    latitude 18
    longitude 20
    description "test"
    agent "testbot 0.1.2"
    reporter_network 'twitter'
    reporter_username 'davidelbe'
    source_url 'https://twitter.com/azazell0/status/113728077904871424'
    image_url 'https://example.com/1723640659/chimp_bigger.png'
  end
end
