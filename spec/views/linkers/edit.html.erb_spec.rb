require 'rails_helper'

RSpec.describe "linkers/edit", type: :view do
  before(:each) do
    @linker = assign(:linker, Linker.create!())
  end

  it "renders the edit linker form" do
    render

    assert_select "form[action=?][method=?]", linker_path(@linker), "post" do
    end
  end
end
