require 'spec_helper'
require_relative '../lib/swagger_document_fetcher.rb'

describe SwaggerDocumentFetcher do
  it 'should fetch various documents recursively' do
    swagger_url = 'https://agco-fuse-trackers-dev.herokuapp.com/api-docs'
    brands_url = 'https://agco-fuse-trackers-dev.herokuapp.com/api-docs/brands'
    swagger_json = JSON.parse('{ "apis": [{ "path": "/brands" }] }')
    brands_json = JSON.parse('{ "resourcePath": "/brands" }')
    expected_documents = [brands_json]

    expect(subject).to receive(:fetch_content_as_json)
      .with(swagger_url)
      .and_return(swagger_json)
    expect(subject).to receive(:fetch_content_as_json)
      .with(brands_url)
      .and_return(brands_json)

    documents = subject.fetch(swagger_url)
    expect(documents).to be_eql(expected_documents)
  end

  it 'should fetch one document' do
    swagger_url = 'https://fuse-equipment-api.herokuapp.com/swagger.json'
    swagger_json = JSON.parse('{ "paths": { "/equipment": { "get": { } } } }')
    expected_documents = [swagger_json]

    expect(subject).to receive(:fetch_content_as_json)
      .with(swagger_url)
      .and_return(swagger_json)

    documents = subject.fetch(swagger_url)
    expect(documents).to be_eql(expected_documents)
  end
end
