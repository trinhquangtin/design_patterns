# factory method
# creator class
class Dialog
  def create_button
    raise NotImplementedError, "#{self.class} has not implemented method #{__method__}"
  end

  def render
    ok_button = create_button
    ok_button.render
  end
end

# concrete creator
class WindowsDialog < Dialog
  def create_button
    WindowsButton.new
  end
end

class WebDialog < Dialog
  def create_button
    WebButton.new
  end
end

class MacDialog < Dialog
  def create_button
    MacButton.new
  end
end

# interface
class Button
  def render; end
  def on_click; end
end

# concrete interface
class WindowsButton
  def render
    puts 'WindowsButton'
  end

  def on_click
    puts 'WindowsButton clicked'
  end
end

class WebButton
  def render
    puts 'WebButton'
  end

  def on_click
    puts 'WebButton clicked'
  end
end

class MacButton
  def render
    puts 'MacButton'
  end

  def on_click
    puts 'MacButton clicked'
  end
end

class Application
  def initialize(factory)
    @factory = factory
  end

  def execute
    if @factory == 'window'
      dialog = WindowsDialog.new
    elsif @factory == 'web'
      dialog = WebDialog.new
    elsif @factory == 'mac'
      dialog = MacDialog.new
    end
    dialog.render
    dialog.create_button.on_click
  end
end

Application.new(ARGV.first).execute
