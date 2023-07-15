<div align="center">
  
# yadyn

A dynamic wallpaper manager, written in Ruby.

<h6>disclaimer: only compatible with Gnome, XFCE, and feh-based wallpaper renderers</h6>

## How to install & use
1. Download the .deb from the releases tab.
2. Install the .deb with <code>sudo dpkg -i ~/Downloads/yadyn.deb</code>.
3. Get or <a href="#making-wallpapers">make a dynamic wallpaper</a>

## Making wallpapers
1. Gather 5 versions of your image.
> one for midnight, another for morning, another for afternoon, another for evening, and another for night.
2. Name them in this naming scheme: image_%.png - % is the stage of the day.
> 0 = midnight, 1 = morning, 2 = afternoon, 3 = evening, 4 = night.
3. Create a yadyn.cfg file.
This is an example yadyn.cfg.
```ini
# Configuration file for yadyn.

[bg]
# the image format for the names. % is replaced with the stage of day
# 0 = midnight, 1 = morning, 2 = afternoon, 3 = evening, 4 = night.
format=/path/to/wallpaper/folder/image_%.png
# how feh will fit the backgrounds.
# fitting modes: center, fill, max, scale, tile
# THIS IS ONLY FOR FEH!!! THIS WILL NOT DO ANYTHING ON GNOME/XFCE!!!!!!
fitting_mode=tile

[stage]
# which hour will be the stage of day
midnight=00
morning=06
afternoon=13
evening=18
night=21
```
Change it as you please.
</div>
