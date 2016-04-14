require_relative 'swagger_definition.rb'

# The Swagger1DefinitionExtractor class is responsible for
# extracting information out of Swagger 1.x documents.
class Swagger1DefinitionExtractor
  def extract(json)
    operations = available_operations(json)
    models = available_models(json)
    SwaggerDefinition.new(operations, models)
  end

  private

  def available_operations(json)
    return {} unless json.key?('apis')

    operations = {}

    json['apis'].map do |api|
      api['operations'].map do |operation|
        operation['path'] = api['path']
        operations[operation['nickname']] = operation
      end
    end.flatten

    operations
  end

  def available_models(json)
    return {} unless json.key?('models')

    json['models']
  end
end
