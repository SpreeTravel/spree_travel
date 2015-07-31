def silent_run(command)

  if RUBY_PLATFORM =~ /mswin/ #windows
    command += " >nul"
  else
    command += " >/dev/null"
  end
  system(command)
end