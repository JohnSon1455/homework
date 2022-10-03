require "spec_helper"
require "rails_helper"

RSpec.describe BucketsController, type: :controller do

  describe "GET index" do
    it "assigns @tasks and render template" do
      bucket1 = Bucket.create(name: "foo", description: "bar")
      bucket2 = Bucket.create(name: "bar", description: "foo")

      get :index

      expect(assigns[:bucket]).to eq([bucket1, bucket2])
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @bucket" do
      buckets = create(:buckets)

      get :show, params: { id: bucket.id }

      expect(assigns[:buckets]).to eq(bucket)
    end

    it "render template" do
      buckets = create(:bucket)

      get :show, params: { id: bucket.id }

      expect(response).to render_template("show")
    end
  end
end