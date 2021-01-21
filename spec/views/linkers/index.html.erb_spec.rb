require 'rails_helper'

RSpec.describe "linkers/index", type: :view do
  before(:each) do
    assign(:linkers, [
      Linker.create!(),
      Linker.create!()
    ])
  end

  it "renders a list of linkers" do
    render
  end
end
