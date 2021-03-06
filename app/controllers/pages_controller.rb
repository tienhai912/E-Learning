class PagesController < ApplicationController
  def show
    if valid_page?
      @tests = current_user.activities.paginate page: params[:page] if signed_in?
      render "pages/#{params[:page_view]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist? Pathname.new(Rails.root +
      "app/views/pages/#{params[:page_view]}.html.erb")
  end
end
