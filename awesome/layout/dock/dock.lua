local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

--Color
local color = require("layout.dock.color")

--Apps
local Item1 = require("layout.dock.apps.launcher")
local Item2 = require("layout.dock.apps.firefox")
local Item3 = require("layout.dock.apps.kitty")
local Item4 = require("layout.dock.apps.vs_code")
local Item5 = require("layout.dock.apps.gimp")
local Item6 = require("layout.dock.apps.telegram")
local Item7 = require("layout.dock.apps.discord")
local Item8 = require("layout.dock.apps.blender")
local Item9 = require("layout.dock.apps.unity")
local Item10 = require("layout.dock.apps.onlyoffice")
local Item11 = require("layout.dock.apps.android_studio")

--Directories
local home = require("layout.dock.directories.home")
local downloads = require("layout.dock.directories.downloads")
local documents = require("layout.dock.directories.documents")
local config = require("layout.dock.directories.config")

--Widgets
local task_popup = require("layout.dock.widgets.tasklist")
local layoutbox = require("layout.dock.widgets.layout_switcher")

--Separator line
local vertical_separator = wibox.widget {
  orientation = 'vertical',
  forced_height = dpi(1.5),
  forced_width = dpi(1.5),
  span_ratio = 0.55,
  widget = wibox.widget.separator,
  color = "#a9b1d6",
  border_color = "#a9b1d6",
  opacity = 0.55
}

--Separator
local Separator = wibox.widget.textbox("   ")
Separator.forced_height = dpi(60)

local Separator2 = wibox.widget.textbox(" ")

--Main dock
local dock = awful.popup {
  screen = s,
  widget = wibox.container.background,
  ontop = true,
  bg = "#00000000",
  visible = true,
  maximum_height = dpi(60),
  placement = function(c)
    awful.placement.bottom(c,
      { margins = { top = dpi(8), bottom = dpi(5), left = 0, right = 0 } })
  end,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 15)
  end,
  type = "dock"
}

dock:struts {
  bottom = dpi(64)
}

dock:setup {
  {
    Separator2,
    Separator2,
    Separator2,
    Separator,
    {
      Item1,
      layout = wibox.container.place
    },
    Separator,
    vertical_separator,
    Separator,
    {
      Item2,
      layout = wibox.container.place
    },
    Separator,
    {
      Item3,
      layout = wibox.container.place
    },
    Separator,
    {
      Item4,
      layout = wibox.container.place
    },
    Separator,
    {
      Item5,
      layout = wibox.container.place
    },
    Separator,
    {
      Item6,
      layout = wibox.container.place
    },
    Separator,
    {
      Item7,
      layout = wibox.container.place
    },
    Separator,
    {
      Item8,
      layout = wibox.container.place
    },
    Separator,
    {
      Item9,
      layout = wibox.container.place
    },
    Separator,
    {
      Item10,
      layout = wibox.container.place
    },
    Separator,

    {
      Item11,
      layout = wibox.container.place
    },

    Separator,
    vertical_separator,
    Separator,

    {
      home,
      layout = wibox.container.place
    },
    Separator,

    {
      downloads,
      layout = wibox.container.place
    },
    Separator,
    {
      documents,
      layout = wibox.container.place
    },

    Separator,
    {
      config,
      layout = wibox.container.place,
    },
    Separator,
    vertical_separator,
    Separator,

    {
      task_popup,
      layout = wibox.container.place,
    },
    Separator,

    {
      layoutbox,
      layout = wibox.container.place,
    },
    Separator,
    Separator2,

    layout = wibox.layout.fixed.horizontal,
  },
  widget = wibox.container.background,
  bg = color.background_dark,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 15)
  end,
}

return dock
