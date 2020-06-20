module Food::MenusHelper
  def menu_date(menu)
    menu.created_at.strftime('%d %b %Y') if menu.created_at
  end
end
