require_relative './swagger_version_checker.rb'

class SwaggerDefinitionExtractor
  # The SwaggerDefinitionExtractor is a facade/strategy that ensures
  # end users will not be bothered about which Swagger document is
  # being handled.
  def initialize(swagger1_definition_extractor,
                 swagger2_definition_extractor)
    @swagger1_definition_extractor = swagger1_definition_extractor
    @swagger2_definition_extractor = swagger2_definition_extractor
  end

  def extract(json)
    version_checker = SwaggerVersionChecker.new(json)

    if version_checker.swagger_1x?
      @swagger1_definition_extractor.extract(json)
    elsif version_checker.swagger_2x?
      @swagger2_definition_extractor.extract(json)
    else
      raise 'Unsupported Swagger version'
    end
  end
end
