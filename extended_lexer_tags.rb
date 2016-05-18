require 'rouge'

module Rouge
  module Lexers
    class Schema < ::Rouge::Lexers::JSON
      tag 'schema'
    end

    class Curl < ::Rouge::Lexers::Shell
      tag 'curl'
    end
  end
end
