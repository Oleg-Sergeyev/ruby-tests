# frozen_string_literal: true

RSpec.describe Commit do
  let(:github_commits) { instance_double(Commit) }

  before do
    allow(github_commits).to receive(:count).and_return(14)
    allow(github_commits).to receive(:committers).and_return([''])
    allow(github_commits).to receive(:self).and_return(self)
    allow(github_commits).to receive(:to_h).and_return(Hash)
  end

  it :self do
    expect(github_commits).not_to be Commit
  end

  it :to_h do
    expect(github_commits.to_h).to be Hash
  end

  it :count do
    expect(github_commits.count).to eq 14
    expect(github_commits.count).to be_kind_of(Integer)
  end

  it :committers do
    expect(github_commits.committers).respond_to? :array
    expect(github_commits.committers).not_to be_empty
  end
end
