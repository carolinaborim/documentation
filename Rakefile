require 'net/http'
require 'json'
require 'logger'

log = Logger.new(STDOUT)
log.level = Logger::INFO

API_URL = ENV.fetch('API_URL', 'agco-fuse-trackers-dev.herokuapp.com')
SWAGGER_ENDPOINT = ENV.fetch('SWAGGER_ENDPOINT', '/api-docs/')
MARKDOWN_DIR = ENV.fetch('MARDKDOWN_DIR', 'source')

desc 'Update documentation to include Swagger operations and models'
task :build do
  log.info('Updating documentation to include Swagger operations and modules...')

  templates = {}

  log.info("Fetching Swagger endpoints at #{SWAGGER_ENDPOINT}...")
  endpoints_json = swagger_json(API_URL, SWAGGER_ENDPOINT)
  log.info('Parsing available endpoints...')
  endpoints = available_endpoints(endpoints_json)

  endpoints.each do |endpoint|
    log.info("Fetching Swagger definitions for #{endpoint}...")
    model_endpoint_json = swagger_json(API_URL, SWAGGER_ENDPOINT, endpoint)

    log.info("Parsing available operations for #{endpoint}...")
    operations = available_operations(model_endpoint_json)
    operations_templates = generate_operations_templates(operations)
    templates.merge!(operations_templates)

    log.info("Parsing available models for #{endpoint}...")
    models = available_models(model_endpoint_json)
    models_templates = generate_models_templates(models)
    templates.merge!(models_templates)
  end

  log.info('Fetching documentation Markdown files...')
  markdown_files = find_markdown_files(MARKDOWN_DIR)
  log.info('Updating documentation files...')
  document_transclusion(templates, markdown_files)
end

task deploy: [:build] do
  sh "bash -c './deploy.sh'"
end

private

def swagger_json(api_url, *endpoints)
  normalized_endpoint = endpoints.join('/').gsub(/\/+/, '/')
  content = Net::HTTP.get(api_url, normalized_endpoint)
  JSON.parse(content)
end

def available_endpoints(json)
  json['apis'].map { |api| api['path'] }
end

def available_operations(json)
  json['apis'].map do |api|
    api['operations'].map do |operation|
      operation['path'] = api['path']
      operation
    end
  end.flatten()
end

def available_models(json)
  json['models']
end

def generate_operations_templates(operations)
  templates = {}

  operations.each do |operation|
    extracted_operation = extract_operation_info(operation)
    template = generate_template(extracted_operation)
    templates["operation:#{operation['nickname']}"] = template
  end

  templates
end

def extract_operation_info(operation)
  {
    path: operation['path'],
    method: operation['method'],
    produces: operation['produces'],
    parameters: operation['parameters'],
    responseMessages: operation['responseMessages']
  }
end

def generate_models_templates(models)
  templates = {}

  models.each do |key, model|
    template = generate_template(model)
    templates["model:#{key}"] = template
  end

  templates
end

def generate_template(json)
  pretty_json = JSON.pretty_generate(json)
  <<-EOS
```json
#{pretty_json}
```
EOS
end

def find_markdown_files(root)
  Dir.entries(root).select do |entry|
    entry =~ /^.*\.md$/
  end.map do |entry|
    "#{root}/#{entry}"
  end
end

def document_transclusion(templates, markdown_files)
  markdown_files.each do |filename|
    index = File.read(filename)

    templates.each do |key, value|
      index.gsub!("[[#{key}]]", value)
    end

    File.open(filename, "w") do |file|
      file.write(index)
    end
  end
end

