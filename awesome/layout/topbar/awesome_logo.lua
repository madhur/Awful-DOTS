--Standard Modules
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local color = require("layout.topbar.colors")

--Main Logo
local button1 = wibox.widget {
  {
    {
      widget = wibox.widget.imagebox,
      image = os.getenv("HOME") .. "/.config/awesome/layout/topbar/icons/awesome-config-logo.jpg",
      resize = true,
      opacity = 1,
    },
    left   = dpi(7),
    right  = dpi(7),
    top    = dpi(7),
    bottom = dpi(7),
    widget = wibox.container.margin
  },
  bg = color.background_dark,
  shape = gears.shape.rounded_rect,
  widget = wibox.container.background,
}

return button1
