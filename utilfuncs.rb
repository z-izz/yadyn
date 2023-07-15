#!/usr/bin/ruby -w

def is_installed(program)
    command = "which #{program}"
    result = `#{command}`
    result.strip!
    
    !result.empty?
end
  

def error(title, text)
    if is_installed("zenity")
        system("zenity --error --title=\"#{title}\" --text=\"#{text}\"")
    else
        puts("#{title}: #{text}")
    end
end

# probably not needed, but ruby file copying makes me go insane
def copy_file(src, dst)
    system("cp #{src} #{dst}")
end

def info(title, text)
    if is_installed("zenity")
        system("zenity --info --title=\"#{title}\" --text=\"#{text}\"")
    else
        puts("#{title}: #{text}")
    end
end

def set_wallpaper(image)
    buffer_used_to_not_exist = true
    if not File.exist?("/home/#{`whoami`.strip}/.yadyn-buffer.png")
        buffer_used_to_not_exist = false
    end
    copy_file(image, "/home/#{`whoami`.strip}/.yadyn-buffer.png")
    if not buffer_used_to_not_exist
        info("yadyn", "It seems like this is your first time using yadyn. Please go to the wallpaper settings in your desktop environment and set the wallpaper to \"/home/#{`whoami`.strip}/.yadyn-buffer.png\". This will allow you to use yadyn.")
    end
end