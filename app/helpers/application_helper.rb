module ApplicationHelper
  def flash_class(level)
    {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-error',
      alert: 'alert alert-error',
    }[level.to_sym]
  end
end
