class Articles::CreateForm < ApplicationForm
  validates_presence_of :title

  def self.attribute_names
    %i(title content)
  end
end
