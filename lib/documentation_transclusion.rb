class DocumentationTransclusion
  # The DocumentationTransclusion class is responsible for
  # choreographing the whole process.
  def initialize(swagger_document_fetcher,
                 swagger_definition_extractor,
                 documentation_finder,
                 template_handler)
    @swagger_document_fetcher = swagger_document_fetcher
    @swagger_definition_extractor = swagger_definition_extractor
    @documentation_finder = documentation_finder
    @template_handler = template_handler
  end

  def transclude(swagger_url, documentation_root)
    swagger_documents = @swagger_document_fetcher.fetch(swagger_url)

    swagger_documents.each do |document|
      swagger_definition = @swagger_definition_extractor.extract(document)
      documentation_filenames = @documentation_finder\
                                .find_all(documentation_root)

      @template_handler.apply(swagger_definition, documentation_filenames)
    end
  end
end
