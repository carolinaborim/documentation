require 'net/http'
require 'json'

# The SwaggerDocumentFetcher class is responsible for
# retrieving Swagger documents.
class SwaggerDocumentFetcher
  def fetch(swagger_url)
    documents = []

    json = fetch_content_as_json(swagger_url)

    if entry_level?(json)
      inner_documents = fetch_recursively(swagger_url, json)
      documents.concat(inner_documents)
    else
      documents << json
    end

    documents
  end

  private

  def fetch_content_as_json(url)
    uri = URI(url)
    content = Net::HTTP.get(uri)
    JSON.parse(content)
  end

  def entry_level?(json)
    return false unless json.key?('apis')

    json['apis'].all? do |api|
      api.keys.length == 1 && api.key?('path')
    end
  end

  def fetch_recursively(swagger_url, json)
    documents = []

    json['apis'].each do |api|
      api_url = [swagger_url, api['path']].join
      api_url.gsub!(%r{\/+}, '/').gsub!(/\:/, ':/')

      api_json = fetch_content_as_json(api_url)
      documents << api_json
    end

    documents
  end
end
