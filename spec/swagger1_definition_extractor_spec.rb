require 'spec_helper'
require 'json'
require './lib/swagger1_definition_extractor.rb'

describe(Swagger1DefinitionExtractor) do
  describe('when extracing definitions from a valid document') do
    let(:content) do
      <<-EOS
{
    "apiVersion": "0.43.0",
    "swaggerVersion": "1.2",
    "basePath": "https://agco-fuse-trackers-dev.herokuapp.com",
    "resourcePath": "/brands",
    "apis": [{
        "path": "/brands",
        "operations": [{
            "method": "GET",
            "type": "Brand_topElement",
            "nickname": "getBrands",
            "produces": [ "application/json" ],
            "parameters": [],
            "responseMessages": []
        }]
    }],
    "models": {
        "Brand": {
            "id": "Brand",
            "required": [ "id","name" ],
            "properties": {
                "id": {
                    "type": "string",
                    "description": "id"
                },
                "name": {
                    "type": "string",
                    "description": "Name of manufacturer"
                }
            }
        }
    }
}
EOS
    end

    let(:json) do
      JSON.parse(content)
    end

    it('should return the correct operations') do
      expected_operations = {
        'getBrands' => {
          'method' => 'GET',
          'type' => 'Brand_topElement',
          'nickname' => 'getBrands',
          'produces' => ['application/json'],
          'parameters' => [],
          'responseMessages' => [],
          'path' => '/brands'
        }
      }

      swagger_definition = subject.extract(json)
      expect(swagger_definition.operations).to be_eql(expected_operations)
    end

    it('should return the correct models') do
      expected_models = {
        'Brand' => {
          'id' => 'Brand',
          'required' => %w(id name),
          'properties' => {
            'id' => {
              'type' => 'string',
              'description' => 'id'
            },
            'name' => {
              'type' => 'string',
              'description' => 'Name of manufacturer'
            }
          }
        }
      }

      swagger_definition = subject.extract(json)
      expect(swagger_definition.models).to be_eql(expected_models)
    end
  end

  describe('when extracting information from an empty document') do
    let(:json) do
      JSON.parse('{}')
    end

    it('should return empty operations') do
      swagger_definition = subject.extract(json)
      expect(swagger_definition.operations).to be_eql({})
    end

    it('should return empty models') do
      swagger_definition = subject.extract(json)
      expect(swagger_definition.models).to be_eql({})
    end
  end
end
