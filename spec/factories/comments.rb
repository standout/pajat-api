FactoryGirl.define do
  factory :comment do
    report
    content "Fixed!"
    agent "Albot 1.0"
    commenter_network "Twitter"
    commenter_username "albertarv"
    new_status "resolved"

    factory :comment_with_agent_ip do
      agent_ip "1.2.3.4"
    end
  end
end
