# frozen_string_literal: true

require_relative '../lib/commit'

desc 'Получение общего количества коммитов репозиторя ruby-tests'
task :commits_count do
  puts "commits count = #{COMMIT.new.count}"
end
