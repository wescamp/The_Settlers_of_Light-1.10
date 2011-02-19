#define WML_TAGS
    [lua]
        code = <<
            local function handler(t)
                wesnoth.fire("message",
                  { speaker = "narrator", caption = t.name, image = t.image, message = t.message })
            end
            wesnoth.register_wml_action("narratorimage", handler)
        >>
    [/lua]
    [lua]
        code = <<
            local function handler(t)
                wesnoth.fire("message",
                  { speaker = "narrator" , message = t.message })
            end
            wesnoth.register_wml_action("narrator", handler)
        >>
    [/lua]
    [lua]
        code = <<
            local function handler(t)
                wesnoth.fire("print",
                  { size = "20", red = "255", green = "127", blue = "0", text = t.print })
            end
            wesnoth.register_wml_action("solprint", handler)
        >>
    [/lua]
    [lua]
        code = <<
            local function handler(t)
                wesnoth.fire("objective",
                  { condition = "win", description = t.objective })
            end
            wesnoth.register_wml_action("towin", handler)
        >>
    [/lua]
    [lua]
        code = <<
            local function handler(t)
                wesnoth.fire("objective",
                  { condition = "lose", description = t.objective })
            end
            wesnoth.register_wml_action("tolose", handler)
        >>
    [/lua]
    [lua]
        code = <<
H = wesnoth.require('lua/helper.lua')
T = H.set_wml_tag_metatable{}

local function effects(f)

  local filtered = wesnoth.get_units(H.get_child(f, 'filter'))

  for i, unit in ipairs(filtered) do
    wesnoth.add_modification(
      unit,
      'object',
      {
         T.effect{
          apply_to = "image_mod",
           replace = f.image
        },
        T.effect{
          apply_to = "ellipse",
          ellipse = f.ellipse
        }
      }
    )
  end
end

wesnoth.register_wml_action("imagemod", effects)>>
    [/lua]
#enddef