require_relative 'swagger_definition.rb'

# The Swagger2DefinitionExtractor class is responsible for
# extracting information out of Swagger 2.x documents.
class Swagger2DefinitionExtractor
  def extract(json)
    operations = available_operations(json)
    models = available_models(json)
    SwaggerDefinition.new(operations, models)
  end

  private

  def available_operations(json)
    return {} unless json.key?('paths')

    operations = {}

    json['paths'].each do |path, path_value|
      path_value.each do |method, method_value|
        method_value['path'] = path
        method_value['method'] = method.upcase
        operations[method_value['operationId']] = method_value
      end
    end.flatten

    operations
  end

  def available_models(json)
    return {} unless json.key?('definitions')

    json['definitions']
  end
end
