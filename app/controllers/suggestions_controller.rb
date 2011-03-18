# app/controllers/suggestions_controller.rb
class SuggestionsController < ApplicationController
  def new
  end

  def edit
    @suggestions = Suggestion.find_by_sid(params[:id])
  end
  
  def create
    user_id = cookies.signed[:user_id]
    memo = params[:suggestions][:memo]
    conn = ActiveRecord::Base.connection
    sql = "select insertSuggestions(" + user_id.to_s + ",'" + memo + "')"
    conn.select_value(sql)
    redirect_to :controller => "suggestions", :action => "index"
  end

  def index
   @suggestions = Suggestions.find(:all, :order => "created_at DESC")
  end
  
  def chooseSuggestion
   user = Users.find(cookies.signed[:user_id])
   div = user.division
   dept = user.department
   if (div == dept)
     @suggestions = Suggestions.find_all_by_div
   else
     @suggestions = Suggestions.find_all_by_depart
   end
  end
  
  def update
    @suggestion = Suggestion.find_by_id(params[:suggestion][:sid])
    if @suggestion.update_attributes(:memo => params[:suggestion][:memo])
       redirect_to :controller => "suggestions", :action => "index"
    else
       render :action => "edit"
    end
  end
  
  def index_by_created
   @suggestions = Suggestions.find(:all, :order => "created_at DESC")
  end
  def index_by_modified
   @suggestions = Suggestions.find(:all, :order => "updated_at DESC")
  end
  def index_by_department
   @suggestions = Suggestions.find(:all, :order => :department)
  end
  def index_by_division
   @suggestions = Suggestions.find(:all, :order => :division)
  end
  def index_by_last_name
   @suggestions = Suggestions.find(:all, :order => :last_name)
  end
end

