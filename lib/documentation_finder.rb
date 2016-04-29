# The Documentatation Finder class is responsible for retrieving
# the documentation markdown files.
class DocumentationFinder
  def find_all(documentation_root)
    Dir.glob("#{documentation_root}/**/*.md")
  end
end
