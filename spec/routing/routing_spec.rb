require "rails_helper"

RSpec.describe "Route for pages#home & users#show", :type => :routing do
  it "route / to the Pages controller, home method" do
    expect(get("/")).to route_to("pages#home")
  end
  it "route /Users to the Users controller, show" do
    expect(get: "/users/1").to route_to(controller: "users", action: "show", id: "1",)
  end
end
