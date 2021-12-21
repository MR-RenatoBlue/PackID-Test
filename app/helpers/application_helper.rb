module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'

      text = <<~EOF
      <script>
        $(document).on("turbolinks:load", function() {
          toastr.#{type}('#{message}', '', 
          {
           closeButton: true,
           progressBar: true,
           preventDuplicates: true,
           preventOpenDuplicates: true 
           })
        });
      </script>
      EOF
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
