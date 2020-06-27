module NavbarHelper
  def user_links
    {
      dashboard: dashboard_path,
      orders: orders_path
    }
  end

  def admin_links
    {
      dashboard: admin_dashboard_path,
      calendar: admin_calendars_month_path,
      users: admin_users_path,
      menus: admin_food_menus_path,
      orders: admin_orders_path
    }
  end

  def user_brand_content
    icon("fas", "utensils").html_safe
  end

  def admin_brand_content
    "[Admin] #{icon("fas", "utensils")}".html_safe
  end
end