module FieldsHelper
  def field_id(field)
    case field
    when ''
    else
      field
    end
  end
end

World FieldsHelper
