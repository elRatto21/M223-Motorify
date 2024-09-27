module ApplicationHelper
    def flash_class(type)
      case type
      when 'notice'
        "flash-notice"  # for success messages
      when 'alert'
        "flash-alert"   # for error or warning messages
      else
        "flash-default" # for other types of messages
      end
    end
  end
