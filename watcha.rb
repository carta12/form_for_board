require 'httparty'
require 'json'
require 'awesome_print'

headers = {cookie: "__uvt=; _s_guit=e02d367217f67dd6b75e716c2bac1b4ac41fa24c918be567b9b55ccfa2a9; _ga=GA1.2.947708476.1511237812; _gid=GA1.2.192847655.1511237812; uvts=6n2O07Ai7K06o6U7; _guinness_session=WTRVeTZDMEdxbVV3dS9VRTdkOEY2UDlWcFJTTVRTT0JnZ3BCY2tJbDJJR3djanRJdnJBR3F2WkZOWVRFRFNMOXlZaFJZUWh0NVg3b1d6eWN5VU5aN0dENzBnOXdIUk9oVjVPNlgrN0NycnVjV0VmSlMvMk45M2dsQWZMdTRyZXVlWG5JeXZOdVgxSzRWTmZwVktxZ0VYQ1hFUkREa2pzbHVqVEk1RzR2ejZpUjlpa3g2OVdKVFIzVmpDSmdQWUpvY2FtUjB4V1Y5akRqeGx1R1VoeFRyN3Izc3BocTJUM0xPbnRGaWtkWDRGRT0tLWZ1M0lPWExPSW5HdWRBOFdQNzRnanc9PQ%3D%3D--7af1a9fb238835d0b5fdadc1361d3eddc41f228c"}
res = HTTParty.get(
  "https://watcha.net/boxoffice.json",
  :headers => headers)

watcha = JSON.parse(res.body)

list =  watcha["cards"]

# ap lists

# title = watcha["cards"].first["items"].first["item"]["title"]
# image = watcha["cards"].first["items"].first["item"]["poster"]["large"]
# desc = watcha["cards"].first["items"].first["item"]["interesting_comment"]["text"]


# CSV.open("movie_list.csv", "wb") do |csv|
#   csv << [title, image, desc]
# end


list.each do |item|
   movie = item["items"].first["item"]
   title = movie["title"]
   image = movie["poster"]["large"]
   desc = movie["interesting_comment"]["text"] if movie["interesting_comment"]

   CSV.open("movie_list.csv", "a+") do |csv|
     csv << [title, image, desc]
   end

end
