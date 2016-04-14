require 'spec_helper'
require_relative '../lib/json_template.rb'

describe JsonTemplate do
  it 'should convert a hash into a pretty JSON template' do
    json = JSON.parse('{ "summary": "...", "description": "..." }')

    pretty = subject.render(json)

    expected = <<-EOS
```json
{
  "summary": "...",
  "description": "..."
}
```
EOS
    expect(pretty).to be_eql(expected)
  end
end
