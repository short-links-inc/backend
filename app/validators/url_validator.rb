class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    record.errors.add(attribute, :invalid) unless valid_url?(value)
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil? && uri.host != 'localhost'
  rescue URI::InvalidURIError
    false
  end
end
