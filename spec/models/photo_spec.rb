require 'spec_helper'

describe Photo do
  it { should belong_to :user }
  it { should have_attached_file(:photo) }
  it { should have_and_belong_to_many :tags }
  it { should validate_presence_of :photo }
  it { should validate_presence_of :caption }
end
