require "spec_helper"
require "rails_helper"

RSpec.describe TasksController, type: :controller do

  describe "GET index" do
    it "assigns @tasks and render template" do
      task1 = Task.create(name: "foo", description: "bar")
      task2 = Task.create(name: "bar", description: "foo")

      get :index

      expect(assigns[:task]).to eq([task1, task2])
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @task" do
      tasks = create(:tasks)

      get :show, params: { id: task.id }

      expect(assigns[:tasks]).to eq(task)
    end

    it "render template" do
      tasks = create(:task)

      get :show, params: { id: task.id }

      expect(response).to render_template("show")
    end
  end
end