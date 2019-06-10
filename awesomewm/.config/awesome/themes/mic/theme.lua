--[[
    Cesious Awesome WM theme
    Created by Micku
--]]
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local lain  = require("lain")

local theme_path = gears.filesystem.get_configuration_dir()  .. "themes/mic/"
theme = {}

theme.icon_dir      = theme_path .. "icons"
theme.default_dir   = awful.util.get_themes_dir() .. "default"

theme.font              = "Roboto Bold 11"
theme.font_big          = "Roboto Bold 12"
theme.font_light        = "Roboto 11"
theme.taglist_font      = "Roboto 11"
theme.notification_font = "Roboto Bold 10"
theme.mono_font         = "Roboto Mono 10"
theme.mono_font_big     = "Roboto Mono Nerd Font Complete 14"

theme.bg_normal   = "#141A1B"
theme.bg_focus    = "#222B2E"
theme.bg_urgent   = "#000000"
theme.bg_minimize = "#101010"
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = "#ffffff"
theme.fg_focus    = "#ffffff"
theme.fg_urgent   = "#ff0000"
theme.fg_minimize = "#ffffff"

theme.border_width  = dpi(3)
theme.border_normal = "#242424"
theme.border_focus  = "#EBEBFF"
theme.border_marked = "#EBEBFF"

theme.hotkeys_modifiers_fg = "#2EB398"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
theme.taglist_fg_focus = "#EDEDED"
theme.taglist_bg_focus = "#242424"

-- Display the taglist squares
theme.taglist_squares_sel   = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel = theme.icon_dir .. "/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.icon_dir .."submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(140)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default_dir.."/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = theme.default_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.default_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.default_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.default_dir.."/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme.default_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.default_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.default_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.default_dir.."/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme.default_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.default_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.default_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.default_dir.."/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.default_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.default_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.default_dir.."/titlebar/maximized_focus_active.png"

theme.wallpaper = theme_path .. "dongbiao-lu-3-03-cut.jpg"

-- You can use your own layout icons like this:
--theme.layout_cornernw   = themes_path .. "cesious/layouts/cornernw.png"
--theme.layout_cornerne   = themes_path .. "cesious/layouts/cornerne.png"
--theme.layout_cornersw   = themes_path .. "cesious/layouts/cornersw.png"
--theme.layout_cornerse   = themes_path .. "cesious/layouts/cornerse.png"
theme.layout_tile       = theme.icon_dir .. "/tile.png"
theme.layout_tileleft   = theme.icon_dir .. "/tileleft.png"
theme.layout_tilebottom = theme.icon_dir .. "/tilebottom.png"
theme.layout_tiletop    = theme.icon_dir .. "/tiletop.png"
theme.layout_fairv      = theme.icon_dir .. "/fairv.png"
theme.layout_fairh      = theme.icon_dir .. "/fairh.png"
theme.layout_spiral     = theme.icon_dir .. "/spiral.png"
theme.layout_dwindle    = theme.icon_dir .. "/dwindle.png"
theme.layout_max        = theme.icon_dir .. "/max.png"
theme.layout_fullscreen = theme.icon_dir .. "/fullscreen.png"
theme.layout_magnifier  = theme.icon_dir .. "/magnifier.png"
theme.layout_floating   = theme.icon_dir .. "/floating.png"

theme.clock             = theme.icon_dir .. "/clock.png"
theme.calendar          = theme.icon_dir .. "/cal.png"

--theme.awesome_icon = themes_path .. "cesious/icons/manjaro64.png"
theme.awesome_icon   = theme.icon_dir .. "/awesome_icon.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Adwaita"

local markup = lain.util.markup
local space3 = markup.font("Roboto 3", " ")
blue        = "#9EBABA"

-- Clock
local mytextclock = wibox.widget.textclock(
    markup("#FFFFFF",
        space3
        .. markup.font(theme.font_big, "")
        .. markup.font(theme.font, " ")
        .. markup.font(theme.font_light, "%H:%M")
        .. space3
    )
)
mytextclock.font = theme.font
local clockbg = wibox.container.background(mytextclock, theme.bg_focus, gears.shape.rectangle)
local clockwidget = wibox.container.margin(clockbg, dpi(0), dpi(3), dpi(5), dpi(5))

-- Calendar
local mytextcalendar = wibox.widget.textclock(
    markup.fontfg(theme.font, "#FFFFFF",
        space3
        .. markup.font(theme.font_big, "")
        .. markup.font(theme.font, " ")
        .. markup.font(theme.font_light,  " %d %b")
        .. space3
    )
)
local calbg = wibox.container.background(mytextcalendar, theme.bg_focus, gears.shape.rectangle)
local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(5), dpi(5))
theme.cal = lain.widget.cal({
    attach_to = { mytextclock, mytextcalendar },
    notification_preset = {
        fg = "#FFFFFF",
        bg = theme.bg_normal,
        position = "top_right",
        font = theme.mono_font
    }
})

-- CPU
local cpu_icon = wibox.widget.imagebox(theme.cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(space3 
            .. markup.font(theme.font_big, "")
            .. markup.font(theme.font, " ")
            .. markup.font(theme.font_light, string.format("%02d", cpu_now.usage) .. "%")
            .. space3
        )
    end
})
local cpubg = wibox.container.background(cpu.widget, theme.bg_focus, gears.shape.rectangle)
local cpuwidget = wibox.container.margin(cpubg, dpi(0), dpi(0), dpi(5), dpi(5))

function round(num, numDecimalPlaces)
  return string.format("%." .. (numDecimalPlaces or 0) .. "f", num)
end

-- RAM
local ram_icon = wibox.widget.imagebox(theme.ram)
local ram = lain.widget.mem({
    settings = function()
        widget:set_markup(space3 
            .. markup.font(theme.font_big, "﬘")
            .. markup.font(theme.font, " ")
            .. markup.font(theme.font_light, round(mem_now.used/1024, 1) .. "GiB")
            .. space3
        )
    end
})
local rambg = wibox.container.background(ram.widget, theme.bg_focus, gears.shape.rectangle)
local ramwidget = wibox.container.margin(rambg, dpi(0), dpi(0), dpi(5), dpi(5))

separator = wibox.widget.textbox(' <span color="' .. blue .. '">| </span>')

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
mykeyboardlayout.widget.font = theme.font_light
mykeyboardlayout.widget.forced_width = dpi(24)
mykeyboardlayout.widget.align = "center"

-- Custom systray
local systray = wibox.widget.systray()
systray.set_base_size(dpi(18))
local systraywidget = wibox.container.margin(systray, dpi(0), dpi(0), dpi(4), dpi(4))

function theme.at_screen_connect(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
	
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist{
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style   = {
            font       = theme.font_light,
            font_focus = theme.font,
            align      = "center",
        },
        --layout   = {
        --    spacing_widget = {
        --        {
        --            forced_width  = 5,
        --            forced_height = 24,
        --            thickness     = 1,
        --            color         = '#777777',
        --            widget        = wibox.widget.separator
        --        },
        --        valign = 'center',
        --        halign = 'center',
        --        widget = wibox.container.place,
        --    },
        --    spacing = 1,
        --    layout  = wibox.layout.fixed.horizontal
        --},
        --widget_template = {
        --    {
        --        wibox.widget.base.make_widget(),
        --        forced_height = 5,
        --        id            = 'background_role',
        --        widget        = wibox.container.background,
        --    },
        --    {
        --        {
        --            id     = 'clienticon',
        --            widget = awful.widget.clienticon,
        --        },
        --        margins = 6,
        --        widget  = wibox.container.margin
        --    },
        --    nil,
        --    create_callback = function(self, c, index, objects) --luacheck: no unused args
        --        self:get_children_by_id('clienticon')[1].client = c
        --    end,
        --    layout = wibox.layout.align.vertical,
        --},
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
            separator,
            s.mytasklist,
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            systraywidget,
            separator,
            mykeyboardlayout,
            separator,
            ram_icon,
            ramwidget,
            separator,
            cpu_icon,
            cpuwidget,
            separator,
            calendarwidget,
            separator,
            clockwidget,
            separator,
            s.mylayoutbox,
        },
    }
end

return theme
