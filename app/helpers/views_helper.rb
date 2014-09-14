module ViewsHelper

  def classify(name)
    #removes white spaces and commas from country names so css class names are appropriate
    name.gsub(/\W/ ,'')
  end
end