def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
  end
  