module ClubHelper
  def link_to_my_club
    if session[:sportsman_id]
      url = edit_sportsman_path(session[:sportsman_id])
    else
      url = login_path
    end
    link_to 'Мой клуб', url
  end
end
