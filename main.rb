# rubocop:disable all

require 'net/http'

threads = []

(count, flag,) = ARGV
if flag == "cf"
    domain = "assets.talenox.com"
else
    domain = "storage.googleapis.com"
end

count.to_i.times do |n|
    threads << Thread.new {
        puts "#{domain}/#{n}\t\tcode: " + Net::HTTP.get_response(URI.parse("http://#{domain}")).code
    }
end

threads.each(&:join)
