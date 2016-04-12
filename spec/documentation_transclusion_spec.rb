require 'spec_helper'
require './lib/swagger_definition.rb'
require './lib/documentation_transclusion.rb'

describe(DocumentationTransclusion) do
  SWAGGER_URL = 'https://agco-fuse-trackers-dev.herokuapp.com/api-docs/'.freeze
  DOCUMENTATION_ROOT = 'source/'.freeze
  swagger_document = <<-EOS
{
   "apiVersion":"0.43.0",
   "swaggerVersion":"1.2",
   "basePath":"https://agco-fuse-trackers-dev.herokuapp.com",
   "resourcePath":"/brands",
   "apis":[
      {
         "path":"/brands",
         "operations":[
            {
               "method":"GET",
               "summary":"Gets all of the AGCO brands in the Product master API",
               "notes":"",
               "type":"Brand_topElement",
               "nickname":"getBrands",
               "produces":[
                  "application/json"
               ],
               "parameters":[
                  {
                     "name":"id",
                     "description":"",
                     "type":"string",
                     "paramType":"query"
                  },
                  {
                     "name":"name",
                     "description":"",
                     "type":"string",
                     "paramType":"query"
                  },
                  {
                     "name":"limit",
                     "description":"paging limit",
                     "type":"string",
                     "paramType":"query"
                  },
                  {
                     "name":"offset",
                     "description":"paging offset",
                     "type":"string",
                     "paramType":"query"
                  }
               ],
               "responseMessages":[
               ]
            }
         ]
      }
   ],
   "models":{
      "Brand":{
         "id":"Brand",
         "required":[
            "id",
            "name"
         ],
         "properties":{
            "id":{
               "type":"string",
               "description":"id"
            },
            "name":{
               "type":"string",
               "description":"Name of manufacturer"
            }
         }
      }
   }
}
EOS
  SWAGGER_DOCUMENT = swagger_document.freeze
  SWAGGER_DOCUMENTS = [SWAGGER_DOCUMENT].freeze
  DOCUMENTATION_FILENAMES = ['source/index.html.md'].freeze
  SWAGGER_DEFINITION = SwaggerDefinition.new(nil, nil).freeze

  let(:swagger_document_fetcher) do
    double('swagger_document_fetcher')
  end

  let(:swagger_definition_extractor) do
    double('swagger_definition_extractor')
  end

  let(:documentation_finder) do
    double('documentation_finder')
  end

  let(:template_handler) do
    double('template_handler')
  end

  it('should transclude a documentation file') do
    documentation_transclusion = DocumentationTransclusion.new(
      swagger_document_fetcher,
      swagger_definition_extractor,
      documentation_finder,
      template_handler)

    expect(swagger_document_fetcher).to receive(:fetch)\
      .with(SWAGGER_URL)\
      .and_return(SWAGGER_DOCUMENTS)

    expect(swagger_definition_extractor).to receive(:extract)\
      .with(SWAGGER_DOCUMENTS.first)\
      .and_return(SWAGGER_DEFINITION)

    expect(documentation_finder).to receive(:find_all)\
      .with(DOCUMENTATION_ROOT)\
      .and_return(DOCUMENTATION_FILENAMES)

    expect(template_handler).to receive(:apply)\
      .with(SWAGGER_DEFINITION, DOCUMENTATION_FILENAMES)

    documentation_transclusion.transclude(SWAGGER_URL, DOCUMENTATION_ROOT)
  end
end
