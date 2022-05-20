# frozen_string_literal: true

require 'open-uri'
require 'json'

# class COMMIT
module COMMIT
  COMMITS = 'https://api.github.com/repos/Oleg-Sergeyev/ruby-tests/commits'

  def count(url = COMMITS)
    JSON.load(URI.open(url)).map { |hash| hash['commit'] }.size
  end
end
