RSpec.describe Commit do
  let(:github_commits) { instance_double(Commit) }
 
  before do
    allow(github_commits).to receive(:count).and_return(14)
    allow(github_commits).to receive(:committers).and_return([''])
  end

  it :count do
    expect(github_commits.count).to eq 14
    #expect(github_commits.count).to be_kind_of(Integer)
  end
  it :committers do
    expect(github_commits.committers).respond_to? :array
    expect(github_commits.committers).not_to be_empty
  end
end
