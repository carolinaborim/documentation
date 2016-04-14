require 'spec_helper'
require_relative '../lib/template_handler.rb'
require_relative '../lib/json_template.rb'
require_relative '../lib/swagger_definition.rb'

describe TemplateHandler do
  let :template do
    double 'template'
  end

  let :file do
    double 'file'
  end

  subject do
    TemplateHandler.new(template)
  end

  it 'should apply a template to a documentation file' do
    expect(File).to receive(:read)
      .with('source/doc1.html.md')
      .and_return('[[operation:getBrands]]\n\n[[model:Brands]]')

    operation_template = '```json\n{ operation: true }\n```'
    expect(template).to receive(:render)
      .with('{ operation: true }')
      .and_return(operation_template)
    model_template = '```json\n{ model: true }\n```'
    expect(template).to receive(:render)
      .with('{ model: true }')
      .and_return(model_template)

    expect(file).to receive(:write)
      .with([operation_template, '\n', '\n', model_template].join)

    expect(File).to receive(:open)
      .with('source/doc1.html.md', 'w')
      .and_yield(file)

    operations = { 'getBrands' => '{ operation: true }' }
    models = { 'Brands' => '{ model: true }' }
    swagger_definition = SwaggerDefinition.new(operations, models)

    documentation_filenames = ['source/doc1.html.md']
    subject.apply(swagger_definition, documentation_filenames)
  end
end
