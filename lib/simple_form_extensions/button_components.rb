module ButtonComponents
  def submit_cancel(*args, &block)
    template.content_tag :div, class: 'form-group' do
      template.content_tag :div, class: 'col-sm-offset-3 col-sm-9' do
        options = args.extract_options!
        options[:class] = [options[:class], 'btn-primary'].compact
        args << options

        # 不加cancel，则无链接。
        if cancel = options.delete(:cancel)
          submit(*args, &block) + '&nbsp;&nbsp;'.html_safe + template.link_to(I18n.t('simple_form.buttons.cancel'), cancel)
        else
          submit(*args, &block)
        end
      end
    end
  end

  def inline_submit_cancel(*args, &block)
    options = args.extract_options!
    options[:class] = [options[:class], 'btn-primary'].compact
    args << options

    # 不加cancel，则无链接。
    if cancel = options.delete(:cancel)
      submit(*args, &block) + '&nbsp;&nbsp;'.html_safe + template.link_to(I18n.t('simple_form.buttons.cancel'), cancel)
    else
      submit(*args, &block)
    end
  end
end

SimpleForm::FormBuilder.send :include, ButtonComponents
