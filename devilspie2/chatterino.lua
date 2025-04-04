debug_print("Window Name: " .. get_window_name())
debug_print("Window Class: " .. get_window_class())

if get_window_class() == "chatterino" then
        set_window_workspace(5)
        maximize()
end
