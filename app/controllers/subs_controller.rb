class SubsController < ApplicationController
  # M odel - All the logic on the table or record, database restraints, associations. Backend
  # V iew - User interactions, this is the front end. It's what they see and interact with. 
          # Keep logic as minimum as possible
  # C ontrollers / routes - Directs traffic between front and back end, actions - what you can do on the webpage. 
              # HTTP VERBS
  # C reate -> POST
  # R ead -> GET
  # U pdate -> PUT / PATCH
  # D estroy -> DELETE

  # All actions must return a response
    # HTML XML JSON or redirects to an action that does
    # HTML by default

  #callbacks - perform logic at certain actions
    # before_action
    # after_action
    # skip_before_action
    # skip_after_action

  # Before_action :method_to_call, only: [:index, :show, :new]

  # Partials are common / shared views

  # READ - GET
    # Page will see and interact with
    # Shows record from the db onto the pages

    # Index action - see all of the record for the table 
      # @model_names = Model_name.all
      # gets all the records and set them to a variable

    # Show Action - See a single record, requires an id
        # find the record that you are looking for 
        # @model_name = Model_name.find(params[:id])

    # New Action - Will display the new record form, creates the record in memory
      # @model_name = Model_name.new

    # Edit Action - Displays the edit record form, requires an id
      #@model_name = Model_name.find(params[:id])

  # Create / POST
  #  Create Action - creates a record from the new action (referenced above)
    # @model_name = Model_name.new(model_name_params)

    # if @model_name.save
    #   do something
    # else
    #   render :new
    # end

  # UPDATE / PATCH
    # Update Action - Allows you to edit a record, edit a form and requires an id
    # @model_name = Model_name.find(params[:id])
    # if @model_name.update(model_name_params)
    #     do something
    # else
    #     render :edit
    # end

  # DESTROY / DELETE
    # Destroy Action - Deletes a record and requires an id
    #  Model_name.find(params[:id]).destroy
    # do something

  # model_name_params
    # Pass certain attributes

    # private
    #   def model_name_params
    #     params.require(:model_name).permit(:attr, :everything that table has)
    #   end

# Index action - see all of the record for the table 
  # @model_names = Model_name.all
  # gets all the records and set them to a variable
  def index
    @subs = Sub.all
  end

  # Show Action - See a single record, requires an id
        # find the record that you are looking for 
        # @model_name = Model_name.find(params[:id])

  def show
      @sub = Sub.find(params[:id])
  end

# New Action - Will display the new record form, creates the record in memory
      # @model_name = Model_name.new

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end

  end

  # Edit Action - Displays the edit record form, requires an id
      #@model_name = Model_name.find(params[:id])

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end

  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end

  end

    # DESTROY / DELETE
    # Destroy Action - Deletes a record and requires an id
    #  Model_name.find(params[:id]).destroy
    # do something

  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
    def sub_params
      params.require(:sub).permit(:name)
    end

end
