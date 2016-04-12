require 'spec_helper'
require './lib/documentation_finder.rb'

describe(DocumentationFinder) do
  it('should find all documentation markdown files that exists') do
    entries = ['doc1.html.md', 'doc2.html.md', 'doc3.html.md', 'ignore.html']
    expect(Dir).to receive(:entries)\
      .with('source')\
      .and_return(entries)

    expected_files = ['source/doc1.html.md',
                      'source/doc2.html.md',
                      'source/doc3.html.md']

    documentation_files = subject.find_all('source')
    expect(documentation_files).to be_eql(expected_files)
  end

  it('should find no documentation markdown files if they do not exist') do
    entries = ['doc1.html', 'doc2.txt', 'doc3.csv']
    expect(Dir).to receive(:entries).and_return(entries)

    expected_files = []

    documentation_files = subject.find_all('source')
    expect(documentation_files).to be_eql(expected_files)
  end
end
