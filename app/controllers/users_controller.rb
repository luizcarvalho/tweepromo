class UsersController < ApplicationController
   before_filter :admin_required
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

    # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end


end
