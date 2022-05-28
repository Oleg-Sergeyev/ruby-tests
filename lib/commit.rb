# frozen_string_literal: true

require 'faraday'
require 'json'

# class COMMIT
class Commit
  COMMITS = 'https://api.github.com/repos/Oleg-Sergeyev/ruby-tests/commits'
  attr_reader :commits, :committers

  def self.call
    @commits = JSON.parse(Faraday.get(COMMITS).body)
    @commits.size
  end
end
