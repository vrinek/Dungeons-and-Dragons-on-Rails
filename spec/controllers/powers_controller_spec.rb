require 'spec_helper'

describe PowersController do

  # This should return the minimal set of attributes required to create a valid
  # Power. As you add validations to Power, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name: "some power"}
  end

  describe "GET index" do
    it "assigns all powers as @powers" do
      power = Power.create! valid_attributes
      get :index
      assigns(:powers).should eq([power])
    end
  end

  describe "GET show" do
    it "assigns the requested power as @power" do
      power = Power.create! valid_attributes
      get :show, :id => power.id
      assigns(:power).should eq(power)
    end
  end

  describe "GET new" do
    it "assigns a new power as @power" do
      get :new
      assigns(:power).should be_a_new(Power)
    end
  end

  describe "GET edit" do
    it "assigns the requested power as @power" do
      power = Power.create! valid_attributes
      get :edit, :id => power.id
      assigns(:power).should eq(power)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Power" do
        expect {
          post :create, :power => valid_attributes
        }.to change(Power, :count).by(1)
      end

      it "assigns a newly created power as @power" do
        post :create, :power => valid_attributes
        assigns(:power).should be_a(Power)
        assigns(:power).should be_persisted
      end

      it "redirects to the created power" do
        post :create, :power => valid_attributes
        response.should redirect_to(Power.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved power as @power" do
        # Trigger the behavior that occurs when invalid params are submitted
        Power.any_instance.stub(:save).and_return(false)
        post :create, :power => {}
        assigns(:power).should be_a_new(Power)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Power.any_instance.stub(:save).and_return(false)
        post :create, :power => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested power" do
        power = Power.create! valid_attributes
        # Assuming there are no other powers in the database, this
        # specifies that the Power created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Power.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => power.id, :power => {'these' => 'params'}
      end

      it "assigns the requested power as @power" do
        power = Power.create! valid_attributes
        put :update, :id => power.id, :power => valid_attributes
        assigns(:power).should eq(power)
      end

      it "redirects to the power" do
        power = Power.create! valid_attributes
        put :update, :id => power.id, :power => valid_attributes
        response.should redirect_to(power)
      end
    end

    describe "with invalid params" do
      it "assigns the power as @power" do
        power = Power.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Power.any_instance.stub(:save).and_return(false)
        put :update, :id => power.id, :power => {}
        assigns(:power).should eq(power)
      end

      it "re-renders the 'edit' template" do
        power = Power.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Power.any_instance.stub(:save).and_return(false)
        put :update, :id => power.id, :power => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested power" do
      power = Power.create! valid_attributes
      expect {
        delete :destroy, :id => power.id
      }.to change(Power, :count).by(-1)
    end

    it "redirects to the powers list" do
      power = Power.create! valid_attributes
      delete :destroy, :id => power.id
      response.should redirect_to(powers_url)
    end
  end

end
