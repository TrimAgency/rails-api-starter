class ConsumerSerializer < ApplicationSerializer
  identifier :id
  
  fields :first_name, :last_name
end