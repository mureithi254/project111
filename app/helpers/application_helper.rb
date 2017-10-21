module ApplicationHelper
  def  load_emergency_form
      render(:partial => 'emergencies/form',:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:raw, :erb, :html, :builder, :ruby, :coffee, :jbuilder])
  end
end
