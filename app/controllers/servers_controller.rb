class ServersController < ApplicationController
  before_filter :authenticate_user!

  # GET /servers
  # GET /servers.json
  def index
    @servers = current_user.servers
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = current_user.servers.find(params[:id])
  end

  # GET /servers/new
  # GET /servers/new.json
  def new
    @server = current_user.servers.new
  end

  # GET /servers/1/edit
  def edit
    @server = current_user.servers.find(params[:id])
    @contact = current_user.contacts.new
    # @server_id = params[:id].to_i
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = current_user.servers.new(params[:server])

      if @server.save
        redirect_to servers_path, notice: 'A new Server was successfully created.'
      else
        render action: "new"
      end
  end

  # PUT /servers/1
  # PUT /servers/1.json
  def update
    @server = current_user.servers.find(params[:id])

      if @server.update_attributes(params[:server])
        redirect_to @server, notice: 'Server was successfully updated.'
      else
        render action: "edit"
      end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server = current_user.servers.find(params[:id])
    @server.destroy
    redirect_to servers_url
  end
end
