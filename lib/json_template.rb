require 'json'

class JsonTemplate
  # The JsonTemplate class responsible for converting a JSON
  # file into its Markdown representation.
  def render(json)
    pretty_json = JSON.pretty_generate(json)

    <<-EOS
```json
#{pretty_json}
```
EOS
  end
end
