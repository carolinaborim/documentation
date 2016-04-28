require 'net/http'
require 'json'
require 'logger'

require './lib/swagger_document_fetcher.rb'
require './lib/swagger_definition_extractor.rb'
require './lib/swagger1_definition_extractor.rb'
require './lib/swagger2_definition_extractor.rb'
require './lib/documentation_finder.rb'
require './lib/template_handler.rb'
require './lib/documentation_transclusion.rb'

log = Logger.new(STDOUT)
log.level = Logger::INFO

DEFAULT_SWAGGER_URL = 'https://agco-fuse-trackers-dev.herokuapp.com/api-docs/'.freeze
SWAGGER_URL = ENV.fetch('SWAGGER_URL', DEFAULT_SWAGGER_URL)
DEFAULT_DOCUMENTATION_ROOT = 'source'.freeze
DOCUMENTATION_ROOT = ENV.fetch('DOCUMENTATION_ROOT', DEFAULT_DOCUMENTATION_ROOT)

desc 'Update documentation to include Swagger operations and models'
task :build do
  log.info('Building the documentation...')

  swagger_document_fetcher = SwaggerDocumentFetcher.new(log)
  swagger_definition_extractor = SwaggerDefinitionExtractor.new(
    Swagger1DefinitionExtractor.new,
    Swagger2DefinitionExtractor.new
  )
  documentation_finder = DocumentationFinder.new
  template_handler = TemplateHandler.new(JsonTemplate.new)

  documentation_transclusion = DocumentationTransclusion.new(
    swagger_document_fetcher,
    swagger_definition_extractor,
    documentation_finder,
    template_handler
  )

  log.info('Updating Swagger references...')
  documentation_transclusion.transclude(SWAGGER_URL, DOCUMENTATION_ROOT)
  log.info('Done!')
end

task deploy: [:build] do
  log.info('Deploying documentation to GitHub pages...')

  log.info('Deploying...')
  sh "bash -c './deploy.sh'"
  log.info('Done!')
end
