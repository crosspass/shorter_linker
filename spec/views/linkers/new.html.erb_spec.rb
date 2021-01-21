require 'rails_helper'

RSpec.describe "linkers/new", type: :view do
  before(:each) do
    assign(:linker, Linker.new())
  end

  it "renders new linker form" do
    render

    assert_select "form[action=?][method=?]", linkers_path, "post" do
    end
  end
end
