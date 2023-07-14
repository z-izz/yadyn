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

def set_wallpaper(mode, image)
    desktop = ENV['XDG_CURRENT_DESKTOP']

    case desktop
    when 'GNOME'
        gnome_set_wallpaper(image)
    when 'XFCE'
        xfce_set_wallpaper(image)
    else
        if is_installed("feh")
            if is_installed("pkill")
                system("pkill -f \"feh --bg-${mode}\"")
                system("feh --bg-#{mode} #{image}")
            else
                error("yadyn", "pkill isn't installed, and it is required to properly end feh!")
            end
        else
            error("yadyn", "feh isn't installed, and it is required for desktop background changing!")
        end
    end
end

def gnome_set_wallpaper(image)
    system("gsettings set org.gnome.desktop.background picture-uri file:///#{image}")
end

def xfce_set_wallpaper(image)
    properties = `xfconf-query -c xfce4-desktop -l`.lines.map(&:chomp)
  
    properties.each do |property|
      next unless property.start_with?('/backdrop/')
      system("xfconf-query -c xfce4-desktop -p \"#{property}\" -s \"#{image}\"")
    end
end