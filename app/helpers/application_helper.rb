module ApplicationHelper
  # 显示警告/通知信息.
  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, ('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + notice).html_safe, class: 'alert  alert-success alert-dismissable') if notice

    msg << (content_tag :div, ('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + alert).html_safe, class: 'alert alert-danger alert-dismissable') if alert
    msg.html_safe
  end
end
