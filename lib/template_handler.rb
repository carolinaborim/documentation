require_relative 'json_template.rb'

# The TemplateHandler class is responsible for applying a given
# SwaggerDefinition to the markdown documentation file.
class TemplateHandler
  def initialize(template)
    @template = template
  end

  def apply(swagger_definition, documentation_filenames)
    read_files(documentation_filenames).each do |filename, content|
      swagger_definition.operations.each do |key, value|
        content.gsub!("[[operation:#{key}]]", @template.render(value))
      end

      swagger_definition.models.each do |key, value|
        content.gsub!("[[model:#{key}]]", @template.render(value))
      end

      save(filename, content)
    end
  end

  private

  def read_files(documentation_filenames)
    files = {}

    documentation_filenames.each do |filename|
      files[filename] = File.read(filename)
    end

    files
  end

  def save(filename, content)
    File.open(filename, 'w') do |file|
      file.write(content)
    end
  end
end
