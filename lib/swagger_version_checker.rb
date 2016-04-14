# The SwaggerVersionChecker class is responsible for
# identifying the Swagger document version.
class SwaggerVersionChecker
  def initialize(json)
    swagger_version = if json.key?('swaggerVersion')
                        Float(json['swaggerVersion'])
                      elsif json.key?('swagger')
                        Float(json['swagger'])
                      else
                        raise 'Swagger version not specified'
                      end

    @swagger_version = swagger_version
  end

  def swagger_1x?
    @swagger_version >= 1.0 && @swagger_version < 2.0
  end

  def swagger_2x?
    @swagger_version >= 2.0 && @swagger_version < 3.0
  end
end
