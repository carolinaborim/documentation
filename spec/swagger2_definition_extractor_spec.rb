require 'spec_helper'
require 'json'
require_relative '../lib/swagger2_definition_extractor.rb'

describe Swagger2DefinitionExtractor do
  describe 'when extracting definitions from a valid document' do
    let :content do
      <<-EOS
{
    "tags": [],
    "host": "fuse-equipment-api.herokuapp.com",
    "definitions": {},
    "basePath": "/",
    "paths": {
        "/equipment": {
            "get": {
                "responses": {
                    "default": {
                        "schema": {
                            "type": "string"
                        },
                        "description": "Successful"
                    }
                },
                "operationId": "getEquipment",
                "tags": [ "equipment" ]
            }
        }
    },
    "definitions": {
        "Tag": {
            "type": "object",
            "properties": {
                "id": {
                    "type": "integer",
                    "format": "int64"
                },
                "name": {
                    "type": "string"
                }
            }
        }
    }
}
EOS
    end

    let :json do
      JSON.parse(content)
    end

    it 'should return the correct operations' do
      expected_operations = {
        'getEquipment' => {
          'method' => 'GET',
          'responses' => {
            'default' => {
              'schema' => {
                'type' => 'string'
              },
              'description' => 'Successful'
            }
          },
          'operationId' => 'getEquipment',
          'tags' => ['equipment'],
          'path' => '/equipment'
        }
      }

      swagger_definition = subject.extract(json)
      expect(swagger_definition.operations).to be_eql(expected_operations)
    end

    it 'should return the correct models' do
      expected_models = {
        'Tag' => {
          'type' => 'object',
          'properties' => {
            'id' => {
              'type' => 'integer',
              'format' => 'int64'
            },
            'name' => {
              'type' => 'string'
            }
          }
        }
      }

      swagger_definition = subject.extract(json)
      expect(swagger_definition.models).to be_eql(expected_models)
    end
  end

  describe 'when extracting information from an empty document' do
    let :json do
      JSON.parse('{}')
    end

    it 'should return empty operations' do
      swagger_definition = subject.extract(json)
      expect(swagger_definition.operations).to be_eql({})
    end

    it 'should return empty models' do
      swagger_definition = subject.extract(json)
      expect(swagger_definition.models).to be_eql({})
    end
  end
end
