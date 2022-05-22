# frozen_string_literal: true

require 'faraday'
require 'json'

# class COMMIT
class Commit
  COMMITS = 'https://api.github.com/repos/Oleg-Sergeyev/ruby-tests/commits'
  attr_accessor :commits

  def initialize(url = COMMITS)
    @commits = JSON.parse(Faraday.get(url).body, symbolize_names: true)
  end

  def self
    commits
  end

  def count
    commits.map { |array| array.dig['commit'] }.size
  end

  def committers
    commits.map { |array| array['commit']['author']['name'] }.uniq
  end
end
