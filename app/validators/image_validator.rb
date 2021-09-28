require "uri"
require "net/http"

class ImageValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :source_url, "incorrect format" unless valid_url? record.source_url
    record.errors.add :source_url, "does not return to an image" unless returns_an_image? record.source_url
  end

  def valid_url?(url)
   begin
    URI.open(url)
   rescue
    false
   end
  end

  private

  def returns_an_image?(url)
    response_url = Net::HTTP.get_response(URI(url))['location']
    url = response_url if response_url

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")
    
    http.start do |http|
      return http.head(uri.request_uri)['Content-Type'].start_with? 'image'
    end
  end
end
