require 'rails_helper'

RSpec.describe "linkers/show", type: :view do
  before(:each) do
    @linker = assign(:linker, Linker.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
