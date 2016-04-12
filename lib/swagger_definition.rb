class SwaggerDefinition
  # The SwaggerDefinition class is responsible for representing
  # the available Swagger operations and models.
  attr_reader :operations, :models

  def initialize(operations, models)
    @operations = operations
    @models = models
  end
end
