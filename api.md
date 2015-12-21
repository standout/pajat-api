# API - pajat

## Latest

    GET /reports

## Near a location

Return all reports near a given location. Latitude and longitude
should be given in Signed Degrees format, ie (lat: 56.89, long: 14.8)
representing Växjö, Sweden. You could add up to 6 decimals for precision.

    GET /reports/near/:lat/:long

## Create

    POST /reports

    latitude:
    longitude:
    description:
    tags: array with tags
    agent: standout-pajat-twitterbot 2.0
    agent_ip: (auto)
    reporter_network: twitter
    reporter_username: davidelbe
    created_at: (auto)

## Comment

    POST /reports/:id/comments

    agent: "web client pajat.se"
    agent_ip: (auto)
    commenter_network:
    commenter_username:
    content: "Great, I have fixed this."
    old_status: (auto)
    new_status: 'resolved'

*** (ideas for upcoming features) ***

## Vote

    POST /reports/:id/votes

    direction: up|down
    positive: true|false
