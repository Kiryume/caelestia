local function getSchemeDir()
  local xdg_state_home = os.getenv("XDG_STATE_HOME")
  if not xdg_state_home or xdg_state_home == "" then
    local home = os.getenv("HOME")
    xdg_state_home = home .. "/.local/state"
  end
  return xdg_state_home .. "/caelestia"
end

local function getSchemePath()
  return getSchemeDir() .. "/scheme.json"
end


return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local scheme_path = getSchemePath()
    local scheme = nil

    local f = io.open(scheme_path, "r")
    if f then
      local content = f:read("*a") -- read entire file
      f:close()
      local ok, decoded = pcall(vim.json.decode, content)
      if ok then
        scheme = decoded.colours
        for k, v in pairs(scheme) do
          if type(v) == 'string' then
            scheme[k] = '#' .. v
          end
        end
      end
    end
    scheme = scheme or require('catppuccin.palettes').get_palette('frappe')
    require('catppuccin').setup({
      flavour = 'frappe',
      color_overrides = {
        all = scheme
      }
    })
    vim.cmd.colorscheme 'catppuccin'
  end,
}
