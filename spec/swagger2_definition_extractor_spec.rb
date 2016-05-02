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
    "basePath": "/",
    "paths": {
        "/equipment": {
            "get": {
                "responses": {
                    "default": {
                        "schema": {
                            "$ref": "#/definitions/Tag"
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
        "Person": {
            "type": "object",
            "properties": {
                "name": {
                    "type": "string"
                }
            }
        },
        "Tag": {
            "type": "object",
            "properties": {
                "id": {
                    "type": "integer",
                    "format": "int64"
                },
                "person": {
                    "$ref": "#/definitions/Person",
                    "type": "object"
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
                'type' => 'object',
                'properties' => {
                  'id' => {
                    'type' => 'integer',
                    'format' => 'int64'
                  },
                  'person' => {
                    'type' => 'object',
                    'properties' => {
                      'name' => {
                        'type' => 'string'
                      }
                    }
                  }
                }
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
            'person' => {
              'properties' => {
                'name' => {
                    'type' => 'string'
                }
              },
              'type' => 'object'
            }
          }
        },
        'Person' => {
          'properties' => {
            'name' => {
              'type' => 'string'
            }
          },
          'type' => 'object'
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
