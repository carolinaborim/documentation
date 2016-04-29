require 'json'

# The JsonTemplate class responsible for converting a JSON
# file into its Markdown representation.
class JsonTemplate
  def render(json)
    pretty_json = JSON.pretty_generate(json)

    <<-EOS
#{pretty_json}
EOS
  end
end
