class ShoutsController < ApplicationController
  def create
     text_subject = TextSubject.create(body: shout_params[:subject])
     current_user.shouts.create(subject: text_subject)
    


    redirect_to :dashboard

  end

  private

  def shout_params
    params.require(:shout).permit(
      :subject
    )
  end
end
