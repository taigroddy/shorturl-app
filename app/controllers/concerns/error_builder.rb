module ErrorBuilder
  # rubocop:disable Metrics/AbcSize
  def build_errors_message(errors, key = nil)
    if errors.is_a?(Hash)
      errors = errors.transform_keys { |k| [key, k] } if key.present?

      errors.map { |k, err| build_errors_message(err, k) }.flatten
    else
      return errors if errors.is_a?(String)

      message = humanize_array(key) { |data| data.map { |k| k.to_s.humanize }.join(': ').to_s }
      message += humanize_array(errors) { |data| " #{data.join(',')}" }
      message
    end
  end
  # rubocop:enable Metrics/AbcSize

  def humanize_array(data)
    if data.is_a?(Array)
      yield data
    else
      data.to_s.humanize
    end
  end
end
