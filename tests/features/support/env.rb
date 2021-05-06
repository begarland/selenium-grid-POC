def browser_name
    (ENV['BROWSER'] ||= ‘firefox’).downcase.to_sym
  end
  