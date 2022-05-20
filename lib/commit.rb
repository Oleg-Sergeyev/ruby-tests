# frozen_string_literal: true

require 'open-uri'
require 'json'

# class COMMIT
class Commit
  COMMITS = 'https://api.github.com/repos/Oleg-Sergeyev/ruby-tests/commits'
  attr_accessor :commits

  def initialize(url = COMMITS)
    @commits = JSON.load(URI.open(url))
  end

  def count
    arr_size = commits.map { |array| array.dig['commit'] }.size
    puts "SIZE = #{arr_size}"
    arr_size
  end

  def committers
    commits.map { |array| array['commit']['author']['name'] }.uniq
  end
end
