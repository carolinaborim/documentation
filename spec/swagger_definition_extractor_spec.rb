require 'json'
require 'spec_helper'
require './lib/swagger_definition_extractor.rb'

describe(SwaggerDefinitionExtractor) do
  let(:swagger1_definition_extractor) do
    double('swagger1_definition_extractor')
  end

  let(:swagger2_definition_extractor) do
    double('swagger2_definition_extractor')
  end

  context('when extracing information from Swagger 1.x document') do
    subject do
      SwaggerDefinitionExtractor.new(swagger1_definition_extractor,
                                     swagger2_definition_extractor)
    end

    let(:content) do
      '{ "host": "fuse-equipment-api.herokuapp.com", "swaggerVersion": "1.2" }'
    end

    let(:json) do
      JSON.parse(content)
    end

    it('should use Swagger1DefinitionExtractor if API version is 1') do
      expect(swagger1_definition_extractor).to receive(:extract)\
        .with(json)
      subject.extract(json)
    end
  end

  context('when extracting information from Swagger 2.x document') do
    subject do
      SwaggerDefinitionExtractor.new(swagger1_definition_extractor,
                                     swagger2_definition_extractor)
    end

    let(:content) do
      '{ "host": "fuse-equipment-api.herokuapp.com", "swagger": "2.0" }'
    end

    let(:json) do
      JSON.parse(content)
    end

    it('should use Swagger2DefinitionExtractor if API version is 2') do
      expect(swagger2_definition_extractor).to receive(:extract)\
        .with(json)
      subject.extract(json)
    end
  end

  context('when extracting information from an unsupported Swagger document') do
    subject do
      SwaggerDefinitionExtractor.new(swagger1_definition_extractor,
                                     swagger2_definition_extractor)
    end

    let(:content) do
      '{ "host": "fuse-equipment-api.herokuapp.com", "swagger": "3.0" }'
    end

    let(:json) do
      JSON.parse(content)
    end

    it('should raise an error') do
      expect do
        subject.extract(json)
      end.to raise_error('Unsupported Swagger version')
    end
  end
end
