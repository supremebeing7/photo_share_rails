require 'spec_helper'

describe Photo do
  it { should belong_to :user }
  it { should have_attached_file(:photo) }
end
