# The Documentatation Finder class is responsible for retrieving
# the documentation markdown files.
class DocumentationFinder
  def find_all(documentation_root)
    entries = Dir.entries(documentation_root).select do |entry|
      entry =~ /^.*\.md$/
    end
    entries.map do |entry|
      "#{documentation_root}/#{entry}"
    end
  end
end
