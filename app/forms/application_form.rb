class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations::Callbacks
  extend ActiveModel::Translation

  before_validation :sanitize_spaces

  def initialize(attributes = {})
    # Define dynamic attributes
    self.class.attribute_names.each do |attr|
      self.class.attribute attr.to_sym
    end
    super attributes
  end

  def self.attribute_names
    []
  end

  def self.attrs_to_sanitize_spaces
    []
  end

  private

  def sanitize_spaces
    return if self.class.attrs_to_sanitize_spaces.blank?

    self.class.attrs_to_sanitize_spaces.each do |a|
      send("#{a}=".to_sym, send(a.to_sym).strip) if send(a.to_sym).present?
    end
  end
end
