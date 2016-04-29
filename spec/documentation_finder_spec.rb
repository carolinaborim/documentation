require 'spec_helper'
require_relative '../lib/documentation_finder.rb'

describe DocumentationFinder do
  it 'should find all documentation markdown files that exists' do
    entries = ['source/doc1.html.md',
               'source/doc2.html.md',
               'source/doc3.html.md']
    expect(Dir).to receive(:glob)
      .with('source/**/*.md')
      .and_return(entries)

    documentation_files = subject.find_all('source')
    expect(documentation_files).to be_eql(entries)
  end

  it 'should find no documentation markdown files if they do not exist' do
    expect(Dir).to receive(:glob)
      .with('source/**/*.md')
      .and_return([])

    documentation_files = subject.find_all('source')
    expect(documentation_files).to be_eql([])
  end
end
