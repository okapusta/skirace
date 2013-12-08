class Options
  def application_root
    './'
  end

  def application_config
    '../../../config/**/*.yml'
  end

  def password_cost
    10
  end
end